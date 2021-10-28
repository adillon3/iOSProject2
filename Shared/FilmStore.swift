//FilmStore.swift

import Foundation
import SwiftUI
import Combine

class FilmStore : ObservableObject
{
    
    @Published var films: [Film]
    
    init (films: [Film] = [])
    {
        self.films = films
    }//END init (films: [Film] = [])
}//END class FilmStore : ObservableObject
