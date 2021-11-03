//
//  UniqueDataSourceBuilder.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/11/03.
//

import Foundation

struct UniqueDataSourceBuilder {

    // MARK: - Static Function

    static func getOrderMaintainedEntities<T: Decodable & Hashable>(
        _ dataType: T.Type,
        existEntities: [T],
        receivedEntities: [T]
    ) -> [T] {
        var receivedEntities = receivedEntities
        var targetEntities: [T] = []

        for existEntity in existEntities {
            var shouldAppendExistEntity = true
            for (receivedEntityIndex, receivedEntity) in receivedEntities.enumerated() {
                if existEntity == receivedEntity {
                    shouldAppendExistEntity = false
                    targetEntities.append(receivedEntity)
                    receivedEntities.remove(at: receivedEntityIndex)
                    break
                }
            }
            if shouldAppendExistEntity {
                targetEntities.append(existEntity)
            }
        }
        for receivedEntity in receivedEntities {
            targetEntities.append(receivedEntity)
        }
        return targetEntities
    }
}
