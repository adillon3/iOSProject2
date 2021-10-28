import SwiftUI

struct AddNewFilm: View
{
    @StateObject var filmStore : FilmStore
    @State private var isInTheaters = false
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var currentColor: Color = .gray
    
    
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Film Details"))
            {
                Image(systemName: "film.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Title", userInput: $name)
                DataInput(title: "Description", userInput: $description)
            
                
                Toggle(isOn: $isInTheaters)
                {
                    Text("Currently in Theaters").font(.headline)
                }.padding()
                
                
                Button(action: addNewFilm)
                {
                    Text("Add Movie")
                        .foregroundColor(currentColor)
                } //END Button(action: addNewFilm) {
            }//END Section(header: Text("Film Details"))
        }//END Form
    }//END var body: some View {
    
    
    func addNewFilm()
    {
        let newFilm = Film(id: UUID().uuidString, name: name, description: description, isInTheaters: isInTheaters, imageName: "NewFilmPoster" )
        filmStore.films.append(newFilm)
    } //END func addNewFilm()

    struct AddNewFilm_Previews: PreviewProvider
    {
        static var previews: some View
        {
            AddNewFilm(filmStore: FilmStore(films: filmData))
        } //END static var previews: some View {
    } //END struct AddNewFilm_Previews: PreviewProvider {


    struct DataInput: View
    {
        var title: String
        @Binding var userInput: String
        
        var body: some View
        {
            VStack(alignment: HorizontalAlignment.leading)
            {
                Text(title)
                    .font(.headline)
                TextField("Enter \(title)", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
            }// VStack(alignment: HorizontalAlignment.leading)
            .padding()
        }//end var body: some View {
    }// struct DataInput: View

}// END var body: some View {

