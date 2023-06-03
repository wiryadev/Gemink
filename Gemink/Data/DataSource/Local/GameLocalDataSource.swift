//
//  GameLocalDataSource.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation
import CoreData

class GameLocalDataSource {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GameDb")

        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil

        return container
    }()

    func getFavoriteGames() throws -> [GameEntity] {
        let fetchRequest = NSFetchRequest<GameEntity>(entityName: "GameEntity")
        return try newTaskContext().fetch(fetchRequest)
    }

    func checkIsFavorite(gameId: Int) -> Bool {
        do {
            let fetchRequest = NSFetchRequest<GameEntity>(entityName: "GameEntity")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(gameId)")
            return try newTaskContext().fetch(fetchRequest).first != nil
        } catch _ {
            return false
        }
    }

    func addFavorite(
        id: Int,
        title: String,
        backgroundImage: String,
        rating: Float,
        description: String,
        releaseDate: Date?
    ) async -> Bool {
        do {
            let taskContext = newTaskContext()
            let result = try await taskContext.perform {
                if let entity = NSEntityDescription.entity(forEntityName: "GameEntity", in: taskContext) {
                    let game = GameEntity(entity: entity, insertInto: taskContext)
                    game.setValue(id, forKey: "id")
                    game.setValue(title, forKey: "title")
                    game.setValue(backgroundImage, forKey: "backgroundImage")
                    game.setValue(description, forKey: "overview")
                    game.setValue(rating, forKey: "rating")
                    game.setValue(releaseDate, forKey: "releaseDate")
                    try taskContext.save()
                    return true
                }
                return false
            }
            return result
        } catch _ {
            return false
        }
    }

    func deleteFavoriteById(gameId: Int) -> Bool {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameEntity")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(gameId)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            return try (newTaskContext().execute(batchDeleteRequest) as? NSBatchDeleteResult)?.result != nil
        } catch _ {
            return false
        }
    }
}

extension GameLocalDataSource {

    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
}
