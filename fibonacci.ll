; ModuleID = "fibonacci.ll"
target triple = ""
target datalayout = ""

@"fmt_double" = constant [4 x i8] c"%lf\00"
@"fmt_string" = constant [3 x i8] c"%s\00"
@"fmt_int" = constant [3 x i8] c"%d\00"
@"fmt_newline" = constant [2 x i8] c"\0a\00"
declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare void @"memcpy"(i8* %".1", i8* %".2", i32 %".3")

declare i32 @"scanf"(i8* %".1", ...)

declare void @"realloc"(i8* %".1", i32 %".2")

define i32 @"main"()
{
entry:
  %"amount" = alloca i32
  store i32 40, i32* %"amount"
  %"amount_val" = load i32, i32* %"amount"
  %"x_raw" = call i8* @"malloc"(i32 %"amount_val")
  %"x" = bitcast i8* %"x_raw" to i32*
  %"element" = getelementptr i32, i32* %"x", i32 0
  store i32 0, i32* %"element"
  %"element.1" = getelementptr i32, i32* %"x", i32 1
  store i32 1, i32* %"element.1"
  %"count" = alloca i32
  store i32 2, i32* %"count"
  br label %"while.body"
while.body:
  %"_val" = load i32, i32* %"count"
  %"element.2" = getelementptr i32, i32* %"x", i32 %"_val"
  %"count_val" = load i32, i32* %"count"
  %"t" = sub i32 %"count_val", 1
  %"element.3" = getelementptr i32, i32* %"x", i32 %"t"
  %"x_val" = load i32, i32* %"element.3"
  %"count_val.1" = load i32, i32* %"count"
  %"t.1" = sub i32 %"count_val.1", 2
  %"element.4" = getelementptr i32, i32* %"x", i32 %"t.1"
  %"x_val.1" = load i32, i32* %"element.4"
  %"t.2" = add i32 %"x_val", %"x_val.1"
  store i32 %"t.2", i32* %"element.2"
  %"count_val.2" = load i32, i32* %"count"
  %"t.3" = add i32 %"count_val.2", 1
  store i32 %"t.3", i32* %"count"
  %"count_val.3" = load i32, i32* %"count"
  %"amount_val.1" = load i32, i32* %"amount"
  %"t.4" = icmp slt i32 %"count_val.3", %"amount_val.1"
  br i1 %"t.4", label %"while.body", label %"while.exit"
while.exit:
  store i32 0, i32* %"count"
  br label %"while.body.1"
while.body.1:
  %"_val.1" = load i32, i32* %"count"
  %"element.5" = getelementptr i32, i32* %"x", i32 %"_val.1"
  %"x_val.2" = load i32, i32* %"element.5"
  %"fmt_ptr" = getelementptr [3 x i8], [3 x i8]* @"fmt_int", i32 0, i32 0
  %"print" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr", i32 %"x_val.2")
  %"fmt_ptr.1" = getelementptr [2 x i8], [2 x i8]* @"fmt_newline", i32 0, i32 0
  %"print.1" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr.1")
  %"count_val.4" = load i32, i32* %"count"
  %"t.5" = add i32 %"count_val.4", 1
  store i32 %"t.5", i32* %"count"
  %"count_val.5" = load i32, i32* %"count"
  %"amount_val.2" = load i32, i32* %"amount"
  %"t.6" = icmp slt i32 %"count_val.5", %"amount_val.2"
  br i1 %"t.6", label %"while.body.1", label %"while.exit.1"
while.exit.1:
  ret i32 0
}