//
//  main.c
//  c
//
//  Created by 彭军涛 on 2018/12/21.
//  Copyright © 2018 彭军涛. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main(){
    char num[6];
    int n;
    gets(num);
    n = strlen(num);
    while (n--) {
        putchar(num[n]);
    }
    return  0;
}
