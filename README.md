# FrontLang

So, I'm into building programming languages now. That's cool I guess

### Usage:

To set this up, make sure you have a method of using ANT; whether that be through an IDE or your command prompt/terminal, I don't care.

Next, clone this repository into your folder of choice; this is where the project will reside, though it can be moved where ever that you like.

The Java generated by JFlex and CUP will not be included, so you'll have to **generate** that using the command `ant generate` in your terminal/command prompt. This task cleans previous java files created by JFlex and CUP as well as the `bin` folder where the compiled files are moved after the `ant compile` command.

Calling `ant compile` will also generate (and by extension, `clean`) FrontLang. If you use an IDE such as Eclipse or Idea, I recommend that you run `ant generate` and use your IDE to run with the `com.cjburkey.frontlang.FrontLang` class as the main class. If you use an IDE, make sure that the `lib/java-cup-11b-runtime.jar` file is included in the classpath.