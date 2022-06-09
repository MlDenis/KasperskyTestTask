//
//  main.swift
//  KasperskyTestTask
//
//  Created by Denis Malyavin on 08.06.2022.
//

// MARK: Not the most compact and productive solution. Made to stand out.

// MARK: Settings
import Foundation

let _passwordPatterns_Numbers: String = "0123456789"
let _passwordPatterns_LowerCase: String = "abcdefghijklmnopqrstuvwxyz"
let _passwordPatterns_CapitalCase: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let _passwordPatterns_SpecialCharacters: String = "!@#$%^&*()-+"
let _passwordPatterns_MinimumRequiredNumberOfCharacters: Int = 6

// MARK: Global variables
var _numberOfMissingCharacters: Int = 0
var _howManyFewerCharactersThanTheMinimumRequiredNumber: Int = 0

// MARK: Life cycle components

func isValidPass (validationMask: String, validatedObject: String) -> Int {
    for element in validationMask {
        if validatedObject.contains(element) {
            return 0
        }
    }
    return 1
}

func solution(n: Int, password: String) -> Int {
    
    _numberOfMissingCharacters += isValidPass(validationMask: _passwordPatterns_Numbers, validatedObject: password)
    _numberOfMissingCharacters += isValidPass(validationMask: _passwordPatterns_LowerCase, validatedObject: password)
    _numberOfMissingCharacters += isValidPass(validationMask: _passwordPatterns_CapitalCase, validatedObject: password)
    _numberOfMissingCharacters += isValidPass(validationMask: _passwordPatterns_SpecialCharacters, validatedObject: password)
    
    if password.count < _passwordPatterns_MinimumRequiredNumberOfCharacters {
        _howManyFewerCharactersThanTheMinimumRequiredNumber = _passwordPatterns_MinimumRequiredNumberOfCharacters - password.count
    }
    
    if _numberOfMissingCharacters >= _howManyFewerCharactersThanTheMinimumRequiredNumber {
        return _numberOfMissingCharacters
    } else if _numberOfMissingCharacters < _howManyFewerCharactersThanTheMinimumRequiredNumber {
        return _howManyFewerCharactersThanTheMinimumRequiredNumber
    } else {
        return 0
    }
    
}

func main() {
    let n = Int(readLine()!)!
    let password = readLine()!
    let answer = solution(n: n, password: password)
    print(answer)
}

// MARK: Life cycle
main()
