//
//  Array+Only.swift
//  Memorize
//
//  Created by Tapan Patel on 14/07/20.
//  Copyright © 2020 Tapan Patel. All rights reserved.
//

import Foundation

extension Array
{
    var only:Element?
    {
        return self.count == 1 ? self.first : nil
    }
}
