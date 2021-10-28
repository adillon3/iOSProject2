

import Foundation
import SwiftUI

struct FilmDetail: View
{
    
    @State private var currentHeader : String = "Movies Description"
    
    let selectedFilm: Film
    var body: some View
    {
        Form {
            Section(header: Text(currentHeader))
            {
                Image(selectedFilm.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                    Text(selectedFilm.name)
                        .font(.headline)
                    
                Text(selectedFilm.description)
                    .font(.body)
                HStack {
                    Text("Currently In Theaters").font(.headline)
                    Spacer()
                    Image(systemName: selectedFilm.isInTheaters ? "checkmark.circle" : "xmark.circle" )
                }
                Button(
                action: {self.switchHeader()},
                    label: {Text("Switch Header Language")}
                )
            }
        }
    }
    
    
    func switchHeader()
    {
        let list = ["Description des films", "Descripción de películas", "Movies Descriptio", "Tuairisgeul nam filmichean", "映画の説明", "Opis filmów", "Mô tả phim", "Disgrifiad Ffilmiau", "Movie Description"]
        currentHeader = list.randomElement() ?? ""
    }
    
 

    struct FilmDetail_Previews: PreviewProvider {
        static var previews: some View {
            FilmDetail(selectedFilm: filmData[0])
        }
    }
}
