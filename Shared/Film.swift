
import Foundation
import SwiftUI

struct Film : Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    
    var isInTheaters: Bool
    var imageName: String
}
