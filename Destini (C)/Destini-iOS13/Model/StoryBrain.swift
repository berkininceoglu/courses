//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain{
    let stories = [Story(
                    title:"1You see fork in the road",
                    choice1: "Take a left",
                    choice2: "Take a right"),
                   Story(
                       title:"2You see a tiger",
                       choice1: "Shout for help",
                       choice2: "Play dead"),
                   Story(
                       title:"3You find a treasure chest",
                       choice1: "Open it",
                       choice2: "Check for traps"),
                   Story(
                                   title:"4You see fork in the road",
                                   choice1: "Take a left",
                                   choice2: "Take a right"),
                                  Story(
                                      title:"5You see a tiger",
                                      choice1: "Shout for help",
                                      choice2: "Play dead"),
                                  Story(
                                      title:"6You find a treasure chest",
                                      choice1: "Open it",
                                      choice2: "Check for traps"),
                                  Story(
                                        title:"7You find a treasure chest",
                                        choice1: "Open it",
                                        choice2: "Check for traps")]
    
    
    var storyCounter = 1
    
    func getStoryTitle()-> String{
        return stories[storyCounter-1].title
    }
    
    func getChoiceOne()-> String{
        return stories[storyCounter-1].choice1
    }
    
    func getChoiceTwo()-> String{
        return stories[storyCounter-1].choice2
    }
    
    mutating func nextQuestion(choice : Int){
        print(choice)
        if(choice == 1){
            storyCounter = storyCounter * 2
        }
        else{
            storyCounter = storyCounter * 2 + 1
        }
        
    }
}

