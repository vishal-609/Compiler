; ModuleID = "hello_world.ll"
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
  %"Hello_ptr" = getelementptr [6 x i8], [6 x i8]* @"_str.Hello", i32 0, i32 0
  %"x" = call i8* @"malloc"(i32 6)
  call void @"memcpy"(i8* %"x", i8* %"Hello_ptr", i32 6)
  %"World_ptr" = getelementptr [6 x i8], [6 x i8]* @"_str.World", i32 0, i32 0
  %"y" = call i8* @"malloc"(i32 6)
  call void @"memcpy"(i8* %"y", i8* %"World_ptr", i32 6)
  %" _ptr" = getelementptr [2 x i8], [2 x i8]* @"_str. ", i32 0, i32 0
  %"pt1" = call i8* @"malloc"(i32 7)
  call void @"memcpy"(i8* %"pt1", i8* %"x", i32 5)
  %".5" = getelementptr inbounds i8, i8* %"pt1", i32 5
  call void @"memcpy"(i8* %".5", i8* %" _ptr", i32 2)
  %"pt1.1" = call i8* @"malloc"(i32 12)
  call void @"memcpy"(i8* %"pt1.1", i8* %"pt1", i32 6)
  %".8" = getelementptr inbounds i8, i8* %"pt1.1", i32 6
  call void @"memcpy"(i8* %".8", i8* %"y", i32 6)
  %"fmt_ptr" = getelementptr [3 x i8], [3 x i8]* @"fmt_string", i32 0, i32 0
  %"print" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr", i8* %"pt1.1")
  %"fmt_ptr.1" = getelementptr [2 x i8], [2 x i8]* @"fmt_newline", i32 0, i32 0
  %"print.1" = call i32 (i8*, ...) @"printf"(i8* %"fmt_ptr.1")
  ret i32 0
}

@"_str.Hello" = constant [6 x i8] c"Hello\00"
@"_str.World" = constant [6 x i8] c"World\00"
@"_str. " = constant [2 x i8] c" \00"gi