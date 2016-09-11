//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public struct SUDateFormatter {

    public static let sharedInstance = DateFormatter()
    private init() {}

}

public struct SUNumberFormatter {

    public static let sharedInstance = NumberFormatter()
    private init() {}

}

public struct SUByteCountFormatter {

    public static let sharedInstance = ByteCountFormatter()
    private init() {}

}

public struct SUDateComponentsFormatter {

    public static let sharedInstance = DateComponentsFormatter()
    private init() {}

}

public struct SUDateIntervalFormatter {

    public static let sharedInstance = DateIntervalFormatter()
    private init() {}

}

public struct SUEnergyFormatter {

    public static let sharedInstance = EnergyFormatter()
    private init() {}

}

public struct SUMassFormatter {

    public static let sharedInstance = MassFormatter()
    private init() {}

}

public struct SULengthFormatter {

    public static let sharedInstance = LengthFormatter()
    private init() {}

}
