## FoldKiwiBlocks

An AppleScript for XCode that makes working with large Kiwi test sources easier.

### What does it do

It takes your Kiwi spec file and folds blocks. Let's say you have something like this:

	context(@"should fold", ^{
	
		beforeAll(^{
			// There was a little guinea-pig
		});	
	
		afterAll(^{
			// There was a little guinea-pig,
			// Who, being little, was not big;
			// He always walked upon his feet,
			// And never fasted when he eat.
		});	
	
		beforeEach(^{
			// When from a place he run away,
			// He never at the place did stay;
			// And while he run, as I am told,
			// He ne'er stood still for young or old.
		});

		afterEach(^{
			// He often squeaked, and sometimes violent,
			// And when he squeaked he ne'er was silent.
			// Though ne'er instructed by a cat,
			// He knew a mouse was not a rat.
		});

		it(@"should fold now", {
			// One day, as I am certified,
			// He took a whim and fairly died;
			// And as I am told by men of sense,
			// He never has been living since.
		});
	});

This it what it looks like in XCode when the script did finish.

	context(@"should fold", ^{
	
		beforeAll(^{...});	
		
		afterAll(^{…});	
	
		beforeEach(^{…});

		afterEach(^{…});

		it(@"should fold now", {…});
	});
	
### Setup

To execute this script using a keyboard shortcut:

1. Make sure the script is executable: `chmod +x FoldKiwiBlocks.applescript`
2. Add a new behavior and click on the keyboard shortcut indicator (next to the name in the list) to add a shortcut
3. Scroll down to the "Run" checkbox, check it, and use the pull-down menu to select the script file

### Known issues

* The script simulates user interaction. So do NOT touch anything while it is running. Bad things may happen!

* Very slow for the sole reason that it needs to simulate user interaction in cause of non existing XCode AppleScript support


### Acknowledgements

Written in order to make working with the excellent [Kiwi framework](https://github.com/allending/Kiwi) even more convenient.

### Legal

As stated before this script simulates user interaction and therfore usage is a bit risky. In case anyting goes wrong: You use this at your own risk! I can not be made responsibe for any damage caused by this software. Now you know!