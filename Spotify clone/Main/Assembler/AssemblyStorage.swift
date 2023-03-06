//
//  Assembler.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 26.01.2023.
//

import Swinject
import UIKit


public class AssemblyStorage {
    
    public static var assemblies: [Assembly] = [ RegistrationAssembly(),
                                                 LoginAssembly(),
                                                 HomeAssembly() ]
}
