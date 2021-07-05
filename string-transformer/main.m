
//
//  main.m
//  string-transformer
//
//  Created by shunnamiki on 2021/07/05.
//

#import <Foundation/Foundation.h>

// MARK: - Input Helpers
NSString *getInputStr(void) {
    // 255 unit long array of characters
    char inputChars[255];

    printf("Input a string: ");
    
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);

    // print as a c string
    // printf("Your string is %s\n", inputChars);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    
    // print NSString object
    // NSLog(@"Input was: %@", inputString);
    
    // TODO: sanitaize \n
    
    return inputString;
}

NSString *getInputMenuIndex(void) {
    char inputChars[255];

    printf("Input a Menu Number: ");
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);

    // print as a c string
    // printf("Your string is %s\n", inputChars);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithUTF8String:inputChars];

    // print NSString object
    // NSLog(@"Input was: %@", inputString);
    
    // TODO: sanitaize \n

    return inputString;
}

// MARK: - Menu Helopers
// TODO: create dict for menu
BOOL validateMenuIndex(NSString *maybeMenuIndex) {
    // TODO: refactor like [1,2,3,...].includes(idx)
    return(
           [maybeMenuIndex isEqual:@"1\n"] ||
           [maybeMenuIndex isEqual:@"2\n"] ||
           [maybeMenuIndex isEqual:@"3\n"] ||
           [maybeMenuIndex isEqual:@"4\n"] ||
           [maybeMenuIndex isEqual:@"5\n"] ||
           [maybeMenuIndex isEqual:@"6\n"]
           );
}

BOOL canNumberize(NSString *maybeVal) {
    // TODO:
    return NO;
}

BOOL isQuestion(NSString *str) {
    return [str hasSuffix:@"?\n"];
}

BOOL isProtestation(NSString *str) {
    return [str hasSuffix:@"!\n"];
}

void handleUppercase(NSString *str) {
    NSString *uppercase = [str uppercaseString];
    NSLog(@"%@", uppercase);
    return;
}

void handleLowercase(NSString *str) {
    NSString *lowercase = [str lowercaseString];
    NSLog(@"%@", lowercase);
    return;
}

void handleNumberize(NSString *str) {
    if(canNumberize(str)) {
        NSLog(@"TODO: Numberize");
    } else {
        NSLog(@"Invalid value. Your input string cannot convert into int.");
    }
    return;
}

void handleCanadianize(NSString *str) {
    NSLog(@"TODO: Canadianize");
    return;
}

void handleRespond(NSString *str) {
    if(isQuestion(str)) {
        NSLog(@"I don't know");
    } else if (isProtestation(str)) {
        NSLog(@"Whoa, calm down!");
    } else {
        // NOTE: NO RESPOND
    }
    return;
}

void handleDoSpaceIt(NSString *str) {
    NSLog(@"TODO: DoSpaceIt");
    return;
}

void *callMenu(NSString *menuIdx, NSString *str) {
    if([menuIdx isEqual:@"1\n"]) handleUppercase(str);
    if([menuIdx isEqual:@"2\n"]) handleLowercase(str);
    if([menuIdx isEqual:@"3\n"]) handleNumberize(str);
    if([menuIdx isEqual:@"4\n"]) handleCanadianize(str);
    if([menuIdx isEqual:@"5\n"]) handleRespond(str);
    if([menuIdx isEqual:@"6\n"]) handleDoSpaceIt(str);
    return NULL;
}


// MARK: - Main
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str, *menuIdx;
        
        str = getInputStr();
        do {
            menuIdx = getInputMenuIndex();
            if(!validateMenuIndex(menuIdx)) {
                printf("Invalid menu index. Please retry.\n");
                continue;
            }
            callMenu(menuIdx, str);
        } while(true);
    }
    return 0;
}


