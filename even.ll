; ModuleID = "even.ll"
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
  %"x" = alloca i32
  store i32 100, i32* %"x"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.body"
while.body:
  %"i_val" = load i32, i32* %"i"
  %"t" = srem i32 %"i_val", 2
  %"t.1" = icmp eq i32 %"t", 0
  br i1 %"t.1", label %"while.body.if", label %"while.body.else"
while.body.if:
  %"Even_ptr" = getelementptr [5 x i8], [5 x i8]* @"_str.Even", i32 0, i32 0
  %"fmt_ptr" = getelementptr [3 x i8], [3 x i8]* @"fmt_string", i32 0, i32 0
  %"print" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr", i8* %"Even_ptr")
  %"fmt_ptr.1" = getelementptr [2 x i8], [2 x i8]* @"fmt_newline", i32 0, i32 0
  %"print.1" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr.1")
  br label %"while.body.endif"
while.body.else:
  %"Odd_ptr" = getelementptr [4 x i8], [4 x i8]* @"_str.Odd", i32 0, i32 0
  %"fmt_ptr.2" = getelementptr [3 x i8], [3 x i8]* @"fmt_string", i32 0, i32 0
  %"print.2" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr.2", i8* %"Odd_ptr")
  %"fmt_ptr.3" = getelementptr [2 x i8], [2 x i8]* @"fmt_newline", i32 0, i32 0
  %"print.3" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr.3")
  br label %"while.body.endif"
while.body.endif:
  %"i_val.1" = load i32, i32* %"i"
  %"t.2" = add i32 %"i_val.1", 1
  store i32 %"t.2", i32* %"i"
  %"i_val.2" = load i32, i32* %"i"
  %"x_val" = load i32, i32* %"x"
  %"t.3" = icmp slt i32 %"i_val.2", %"x_val"
  br i1 %"t.3", label %"while.body", label %"while.exit"
while.exit:
  ret i32 0
}

@"_str.Even" = constant [5 x i8] c"Even\00"
@"_str.Odd" = constant [4 x i8] c"Odd\00"