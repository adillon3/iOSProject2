

import Foundation
import SwiftUI

struct FilmDetail: View {
    let selectedFilm: Film
    var body: some View
    {
        Form {
            Section(header: Text("Movie Details"))
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
            }
        }
    }
    
                
    
 

    struct FilmDetail_Previews: PreviewProvider {
        static var previews: some View {
            FilmDetail(selectedFilm: filmData[0])
        }
    }
}
