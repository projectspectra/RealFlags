//
//  RealFlags
//  Easily manage Feature Flags in Swift
//
//  Created by the Mobile Team @ ImmobiliareLabs
//  Email: mobile@immobiliare.it
//  Web: http://labs.immobiliare.it
//
//  Copyright ©2021 Immobiliare.it SpA. All rights reserved.
//  Licensed under MIT License.
//

import Foundation

extension Sequence where Element == Mirror.Child {
    typealias ConfigurableFeatureFlag = (label: String, value: FeatureFlagConfigurableProtocol)
    
    /// This function return all the properties from a sequence generated by
    /// Mirror of the object (`Mirror(reflecting: loadedCollection).children`).
    /// It will return only the list of `@Flag` `@FlagCollection` properties.
    ///
    /// - Returns: `[ConfigurableFeatureFlag]`
    internal func featureFlagsConfigurableProperties() -> [ConfigurableFeatureFlag] {
        var featureFlagsProps = [ConfigurableFeatureFlag]()
        for property in self {
            guard let label = property.label, let obj = property.value as? FeatureFlagConfigurableProtocol else {
                continue
            }
            
            let propertyName = (label.hasPrefix("_") ? String(label.dropFirst()) : label)
            featureFlagsProps.append( (label: propertyName, value: obj) )
        }
        
        return featureFlagsProps
    }

}