//
//  Define.h
//  LichCongGiao
//
//  Created by Nguyễn Mạnh Huy on 3/13/14.
//  Copyright (c) 2014 Nguyễn Mạnh Huy. All rights reserved.
//

#ifndef LichCongGiao_Define_h
#define LichCongGiao_Define_h

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] )
#define IS_IPOD   ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )

#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )
#define IS_IPHONE_4 ( IS_IPHONE && !IS_WIDESCREEN)
#define IS_IPAD ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPad" ] )
#define IS_IOS_7 ( [ [ UIDevice currentDevice ].systemVersion floatValue] >= 7)
#define IS_IOS_6 ( [ [ UIDevice currentDevice ].systemVersion floatValue] >= 6 && !IS_IOS_7)

#endif
