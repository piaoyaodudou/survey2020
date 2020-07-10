//
//  main.c
//  00.CDemo
//
//  Created by 莫晓卉 on 2020/7/1.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
  // insert code here...
  printf("Hello, World!\n");
  

  printf("%d\n", subtractProductAndSum(4421));
  
  return 0;
}

int subtractProductAndSum(int n) {
  int sum = 0;
  int product = n%10;
  int current = n;
  int i = 0;
  while (current >= 10) {
    int c = current % 10;
    sum += c;
    if (i != 0) {
      product *= c;
    }
    current /= 10;
    i++;
  }
  sum += current;
  product *= current;
  return product - sum;
}
