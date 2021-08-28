//
//  GetInitialAppOpenUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetInitialAppOpenUseCase {
    func execute() -> Single<Bool>
}

final class GetInitialAppOpenUseCaseImpl: GetInitialAppOpenUseCase {

    private let initialAppOpenRepository: InitialAppOpenRepository

    // MARK: - Initializer

    init(
        initialAppOpenRepository: InitialAppOpenRepository
    ) {
        self.initialAppOpenRepository = initialAppOpenRepository
    }

    // MARK: - GetInitialAppOpenUseCase

    func execute() -> Single<Bool> {
        return initialAppOpenRepository.get()
    }
}
