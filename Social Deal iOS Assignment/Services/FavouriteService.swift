//
//  FavouriteService.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 16/02/2025.
//

class FavouriteService {
    static let shared = FavouriteService()
    private init() {
        loadFavourites()
    }
    
    private(set) var favourites: [Deal] = []
    
    private func loadFavourites() {
        favourites = StorageRepository.getFavourites()
    }
    
    func isFavourite(_ deal: Deal) -> Bool {
        return favourites.contains(where: { $0.id == deal.id })
    }
    
    func toggleFavourite(_ deal: Deal) {
        if favourites.contains(where: { $0.id == deal.id }) {
            favourites.removeAll(where: { $0.id == deal.id })
            
        } else {
            favourites.append(deal)
        }
        
        StorageRepository.saveFavourites(favourites)
    }
}
