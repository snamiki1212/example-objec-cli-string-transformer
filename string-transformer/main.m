
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

BOOL canNumberize(NSString *maybeNumberableVal) {
    return [[NSScanner scannerWithString:maybeNumberableVal] scanInt:nil];
}

BOOL isQuestion(NSString *str) {
    return [str hasSuffix:@"?\n"];
}

BOOL isProtestation(NSString *str) {
    return [str hasSuffix:@"!\n"];
}

int numberize(NSString *str) {
    return [str intValue];
}

void handleUppercase(NSString *str) {
    NSString *newStr = [str uppercaseString];
    NSLog(@"%@", newStr);
    return;
}

void handleLowercase(NSString *str) {
    NSString *newStr = [str lowercaseString];
    NSLog(@"%@", newStr);
    return;
}

void handleNumberize(NSString *str) {
    if(canNumberize(str)) {
        NSLog(@"%d", numberize(str));
    } else {
        NSLog(@"Invalid value. Your input string cannot convert into int.");
    }
    return;
}

void handleCanadianize(NSString *str) {
    NSString *newStr = [NSString stringWithFormat:@"%@, eh?", str];
    NSLog(@"%@", newStr);
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
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    NSLog(@"%@", newStr);
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

void printMenu(void) {
    NSString *l0 = @"[Menu]";
    NSString *l1 = @"1. Uppercase";
    NSString *l2 = @"2. Lowercase";
    NSString *l3 = @"3. Numberize";
    NSString *l4 = @"4. Canadianize";
    NSString *l5 = @"5. Respond";
    NSString *l6 = @"6. De-Space-It";
    NSString *msg = [
                     NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",
                     l0,
                     l1,
                     l2,
                     l3,
                     l4,
                     l5,
                     l6
                     ];
    NSLog(@"%@", msg);
    return;
}


// MARK: - Main
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str, *menuIdx;
        
        str = getInputStr();
        do {
            printMenu();
            menuIdx = getInputMenuIndex();
            if(!validateMenuIndex(menuIdx)) {
                printf("Invalid menu index. Please retry.\n");
                continue;
            }
            callMenu(menuIdx, str);
            printf("\n");
        } while(true);
    }
    return 0;
}


