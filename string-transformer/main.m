
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
    printf("Your string is %s\n", inputChars);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    
    // print NSString object
    NSLog(@"Input was: %@", inputString);
    
    return inputString;
}

NSString *getInputMenuIndex(void) {
    char inputChars[255];

    printf("Input a Menu Number: ");
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);

    // print as a c string
    printf("Your string is %s\n", inputChars);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithUTF8String:inputChars];

    // print NSString object
    NSLog(@"Input was: %@", inputString);
    
    // TODO: sanitaize \n

    return inputString;
}

// MARK: - Menu Helopers
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


NSString *toUppercase(NSString *str) {
    // TODO: create logic
    NSLog(@"TODO: Uppercase");
    return str;
}

void handleUppercase(NSString *str) {
    NSString *uppercase = toUppercase(str);
    NSLog(@"%@", uppercase);
    return;
}


void *callMenu(NSString *menuIdx, NSString *str) {
    if([menuIdx isEqual:@"1\n"]) handleUppercase(str);
    return NULL;
}


// MARK: - Main
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str, *menuIdx;
        
        str = getInputStr();
        do {
            menuIdx = getInputMenuIndex();
            NSLog(@"menuidx: %@", menuIdx);
            if(!validateMenuIndex(menuIdx)) {
                NSLog(@"Invalid input menu index. Please retry.");
                continue;
            }
            callMenu(menuIdx, str);
        } while(true);
    }
    return 0;
}


