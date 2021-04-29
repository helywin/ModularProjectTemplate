//
// Created by jiang on 2021/4/9.
//

#include <cstdio>
#include "library.hpp"

#include "build_time.h"

int main()
{
    func();
    printf(BUILD_TIME);
    return 0;
}