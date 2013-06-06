#!/usr/bin/osascript

set d to 0.1
set foldBlocks to {"it(@", "beforeEach(^", "afterEach(^", "beforeAll(^", "afterAll(^"}

tell application "System Events"
	tell process "Xcode"
		-- Activate Xcode if necessary
		set frontmost to true
		delay d
		-- This makes sure everything is unfolded
		keystroke "a" using {command down}
		delay d
		-- Unfold all
		key code 124 using {option down, command down}
		delay d
		-- copy text to clipboard
		keystroke "c" using {command down}
		delay d
		set txt to get the clipboard -- store clipboard text
		key code 123 -- go to top
	end tell
end tell

-- Fold blocks
repeat with curBlock in foldBlocks
	# Count of block identifier
	set c to findLr(txt, curBlock)
	# Find each one and fold
	tell application "System Events"
		tell process "Xcode"
			-- Activate Xcode if necessary
			set frontmost to true
			-- Show find bar
			keystroke "f" using {command down}
			delay d
			keystroke curBlock
			delay d
			keystroke return
			delay d
			key code 48 -- Tab
			delay d
			repeat c times
				keystroke "g" using {command down}
				delay d
				key code 124 using {command down}
				delay d
				key code 123 using {option down, command down}
				delay d
			end repeat
		end tell
	end tell
end repeat

-- Hide search panel
tell application "System Events"
	tell process "Xcode"
			keystroke "f" using {command down}
			delay d
			key code 53
	end tell
end tell

on findLr(the_string, charTF)
	set AppleScript's text item delimiters to charTF --use of the searched string to separate bits
	set the_list to text items of the_string --put those bits in a list
	set charNbr to ((count of the_list) - 1) --count those bits, minus 1
	set AppleScript's text item delimiters to ""
	return charNbr
end findLr