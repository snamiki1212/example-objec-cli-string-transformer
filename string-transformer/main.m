
//
//  main.m
//  string-transformer
//
//  Created by shunnamiki on 2021/07/05.
//

#import <Foundation/Foundation.h>

// MARK: - NSString Helper
NSString *sanitaizeBreakLine(NSString *str) {
    return [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

// MARK: - Input Helpers
NSString *getInputStr(void) {
    char inputChars[255];
    printf("Input a string: ");
    fgets(inputChars, 255, stdin);
    NSString *inputString = sanitaizeBreakLine([NSString stringWithUTF8String:inputChars]);
    return inputString;
}

NSString *getInputMenuIndex(void) {
    char inputChars[255];
    printf("Input a Menu Number: ");
    fgets(inputChars, 255, stdin);
    NSString *inputString = sanitaizeBreakLine([NSString stringWithUTF8String:inputChars]);
    return inputString;
}

// MARK: - Menu Helopers
// TODO: create dict for menu
BOOL validateMenuIndex(NSString *maybeMenuIndex) {
    // TODO: refactor like [1,2,3,...].includes(idx)
    return(
           [maybeMenuIndex isEqual:@"1"] ||
           [maybeMenuIndex isEqual:@"2"] ||
           [maybeMenuIndex isEqual:@"3"] ||
           [maybeMenuIndex isEqual:@"4"] ||
           [maybeMenuIndex isEqual:@"5"] ||
           [maybeMenuIndex isEqual:@"6"]
           );
}

BOOL canNumberize(NSString *maybeNumberableVal) {
    return [[NSScanner scannerWithString:maybeNumberableVal] scanInt:nil];
}

BOOL isQuestion(NSString *str) {
    return [str hasSuffix:@"?"];
}

BOOL isProtestation(NSString *str) {
    return [str hasSuffix:@"!"];
}

int numberize(NSString *str) {
    return [str intValue];
}

void printNSString(NSString *str) {
    printf("%s", [str UTF8String]);
    return;
}

void handleUppercase(NSString *str) {
    NSString *newStr = [str uppercaseString];
    printNSString(newStr);
    return;
}

void handleLowercase(NSString *str) {
    NSString *newStr = [str lowercaseString];
    printNSString(newStr);
    return;
}

void handleNumberize(NSString *str) {
    if(canNumberize(str)) {
        printf("%d", numberize(str));
    } else {
        printf("Your input value cannot be numberized.");
    }
    return;
}

void handleCanadianize(NSString *str) {
    NSString *newStr = [NSString stringWithFormat:@"%@, eh?", sanitaizeBreakLine(str)];
    printNSString(newStr);
    return;
}

void handleRespond(NSString *str) {
    if(isQuestion(str)) {
        printf("I don't know");
    } else if (isProtestation(str)) {
        printf("Whoa, calm down!");
    } else {
        printf("(No Respond)");
    }
    return;
}

void handleDoSpaceIt(NSString *str) {
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    printNSString(newStr);
    return;
}

void *callMenu(NSString *menuIdx, NSString *str) {
    if([menuIdx isEqual:@"1"]) handleUppercase(str);
    if([menuIdx isEqual:@"2"]) handleLowercase(str);
    if([menuIdx isEqual:@"3"]) handleNumberize(str);
    if([menuIdx isEqual:@"4"]) handleCanadianize(str);
    if([menuIdx isEqual:@"5"]) handleRespond(str);
    if([menuIdx isEqual:@"6"]) handleDoSpaceIt(str);
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
    printNSString(msg);
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


