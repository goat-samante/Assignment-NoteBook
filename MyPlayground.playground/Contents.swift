import UIKit

//Dictionary - collection that stores unordered list of values
//every value in a dictionary has a key
//var name: [key : value] pairs

var dictionary = [Int: String]()
dictionary = [1: "a", 2: "b"]

var inferenceDictionary = [1: "a", 2: "b"] //typical method for setup
inferenceDictionary[3] = "c"
inferenceDictionary
inferenceDictionary.count
inferenceDictionary.removeValue(forKey: 1)//pass key to the function
inferenceDictionary
inferenceDictionary[2] = "new"
inferenceDictionary[4] = "d"
inferenceDictionary.updateValue("f", forKey: 5)
inferenceDictionary

if let value = inferenceDictionary[1]
{
    print(value)
}

let emptyDictionary = [Int: String]()
emptyDictionary.isEmpty
if emptyDictionary.isEmpty
{
    print("Dictionary is empty")
}

var colors = ["Red", "White", "Blue"]
var numbers = ["1", "2", "3"]
var multi = [1: [colors], 2:[numbers]]

var myAddress = ["City":"Chicago", "Zip": "60611"]
myAddress["City"] = "Wheaton"
