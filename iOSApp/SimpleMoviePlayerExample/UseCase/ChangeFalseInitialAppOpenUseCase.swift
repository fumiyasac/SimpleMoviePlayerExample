//
//  ChangeFalseInitialAppOpenUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol ChangeFalseInitialAppOpenUseCase {
    func execute() -> Completable
}

final class ChangeFalseInitialAppOpenUseCaseImpl: ChangeFalseInitialAppOpenUseCase {

    private let initialAppOpenRepository: InitialAppOpenRepository

    // MARK: - Initializer

    init(
        initialAppOpenRepository: InitialAppOpenRepository
    ) {
        self.initialAppOpenRepository = initialAppOpenRepository
    }

    // MARK: - ChangeFalseInitialAppOpenUseCase

    func execute() -> Completable {
        return initialAppOpenRepository.changeFalse()
    }
}
