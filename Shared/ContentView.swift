//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 10/21/21.
//

import SwiftUI

struct ContentView: View
{
    
    @StateObject private var filmStore : FilmStore = FilmStore(films: filmData)
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                List
                {
                    ForEach (filmStore.films)
                    { film in
                        ListCell(film: film)
                    }//END List
                    
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                        
                }//List
                .navigationBarTitle(Text("Movies!"))
                .navigationBarItems(leading: NavigationLink(destination: AddNewFilm(filmStore: self.filmStore))
                {
                    Text("Add")
                        .foregroundColor(.blue)
            
                },trailing: EditButton()) //END .navigationBarItems(leading: NavigationLink
            }
            .background(.blue)
           
        }//END NavigationView
    }//END var body: some View
    func deleteItems(at offsets: IndexSet)
    {
        filmStore.films.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int)
    {
        filmStore.films.move(fromOffsets: source, toOffset: destination)
    }
}//END struct ContentView: View

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

struct ListCell: View
{
    var film: Film
    
    var body: some View
    {
        NavigationLink(destination: FilmDetail(selectedFilm: film))
        {
            HStack
            {
                Image(film.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                Text(film.name)
            }//END HStack
        }//END NavigationLink(destination: filmDetail(selectedFilm: film))
    }//END var body: some View
}//END struct ListCell: View

