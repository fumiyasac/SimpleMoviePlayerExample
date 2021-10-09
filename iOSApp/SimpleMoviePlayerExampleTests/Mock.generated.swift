// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.1

import SwiftyMocky
import XCTest
import Foundation
@testable import SimpleMoviePlayerExample


// MARK: - ChangeFalseInitialAppOpenUseCase

open class ChangeFalseInitialAppOpenUseCaseMock: ChangeFalseInitialAppOpenUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Completable {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - DeleteFavoriteMainMovieUseCase

open class DeleteFavoriteMainMovieUseCaseMock: DeleteFavoriteMainMovieUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(mainMovieId: MainMovieId) -> Completable {
        addInvocation(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__mainMovieId_mainMovieId(let lhsMainmovieid), .m_execute__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__mainMovieId_mainMovieId: return ".execute(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(mainMovieId: Parameter<MainMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - DeleteLastShownFeatureMoviePlayTimeUseCase

open class DeleteLastShownFeatureMoviePlayTimeUseCaseMock: DeleteLastShownFeatureMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable {
        addInvocation(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_deletePlayTime__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_deletePlayTime__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_deletePlayTime__featuredMovieId_featuredMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_deletePlayTime__featuredMovieId_featuredMovieId: return ".deletePlayTime(featuredMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - DeleteLastShownMainMoviePlayTimeUseCase

open class DeleteLastShownMainMoviePlayTimeUseCaseMock: DeleteLastShownMainMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(mainMovieId: MainMovieId) -> Completable {
        addInvocation(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__mainMovieId_mainMovieId(let lhsMainmovieid), .m_execute__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__mainMovieId_mainMovieId: return ".execute(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(mainMovieId: Parameter<MainMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - FavoriteCoodinator

open class FavoriteCoodinatorMock: FavoriteCoodinator, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func coordinateToMainMovieDetailPlayer(mainMovieId: MainMovieId) {
        addInvocation(.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
    }


    fileprivate enum MethodType {
        case m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(let lhsMainmovieid), .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId: return ".coordinateToMainMovieDetailPlayer(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func coordinateToMainMovieDetailPlayer(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func coordinateToMainMovieDetailPlayer(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - FavoriteMainMovieRepository

open class FavoriteMainMovieRepositoryMock: FavoriteMainMovieRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[FavoriteMainMovieEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[FavoriteMainMovieEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }

    open func save(mainMovieEntity: MainMovieEntity) -> Completable {
        addInvocation(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`)))
		let perform = methodPerformValue(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`))) as? (MainMovieEntity) -> Void
		perform?(`mainMovieEntity`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for save(mainMovieEntity: MainMovieEntity). Use given")
			Failure("Stub return value not specified for save(mainMovieEntity: MainMovieEntity). Use given")
		}
		return __value
    }

    open func delete(mainMovieId: MainMovieId) -> Completable {
        addInvocation(.m_delete__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_delete__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_delete__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for delete(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for delete(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll
        case m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>)
        case m_delete__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match

            case (.m_save__mainMovieEntity_mainMovieEntity(let lhsMainmovieentity), .m_save__mainMovieEntity_mainMovieEntity(let rhsMainmovieentity)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieentity, rhs: rhsMainmovieentity, with: matcher), lhsMainmovieentity, rhsMainmovieentity, "mainMovieEntity"))
				return Matcher.ComparisonResult(results)

            case (.m_delete__mainMovieId_mainMovieId(let lhsMainmovieid), .m_delete__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            case let .m_save__mainMovieEntity_mainMovieEntity(p0): return p0.intValue
            case let .m_delete__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            case .m_save__mainMovieEntity_mainMovieEntity: return ".save(mainMovieEntity:)"
            case .m_delete__mainMovieId_mainMovieId: return ".delete(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[FavoriteMainMovieEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func delete(mainMovieId: Parameter<MainMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_delete__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[FavoriteMainMovieEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[FavoriteMainMovieEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[FavoriteMainMovieEntity]>).self)
			willProduce(stubber)
			return given
        }
        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func delete(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_delete__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
        public static func save(mainMovieEntity: Parameter<MainMovieEntity>) -> Verify { return Verify(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`))}
        public static func delete(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_delete__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, perform: @escaping (MainMovieEntity) -> Void) -> Perform {
            return Perform(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), performs: perform)
        }
        public static func delete(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_delete__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - FavoriteView

open class FavoriteViewMock: FavoriteView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func setupCollectionView() {
        addInvocation(.m_setupCollectionView)
		let perform = methodPerformValue(.m_setupCollectionView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_setupCollectionView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupCollectionView, .m_setupCollectionView): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_setupCollectionView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupCollectionView: return ".setupCollectionView()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func setupCollectionView() -> Verify { return Verify(method: .m_setupCollectionView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupCollectionView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setupCollectionView, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - FeaturedMovieRepository

open class FeaturedMovieRepositoryMock: FeaturedMovieRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[FeaturedMovieEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[FeaturedMovieEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[FeaturedMovieEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[FeaturedMovieEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[FeaturedMovieEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[FeaturedMovieEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetCarouselMainBannersUseCase

open class GetCarouselMainBannersUseCaseMock: GetCarouselMainBannersUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<CarouselMainBannerDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<CarouselMainBannerDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<CarouselMainBannerDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<CarouselMainBannerDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<CarouselMainBannerDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<CarouselMainBannerDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetFavoriteMainMoviesUseCase

open class GetFavoriteMainMoviesUseCaseMock: GetFavoriteMainMoviesUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<FavoriteMainMoviesDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<FavoriteMainMoviesDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<FavoriteMainMoviesDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<FavoriteMainMoviesDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<FavoriteMainMoviesDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<FavoriteMainMoviesDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetFeaturedMoviesUseCase

open class GetFeaturedMoviesUseCaseMock: GetFeaturedMoviesUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<[FeaturedMovieEntity]> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<[FeaturedMovieEntity]>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<[FeaturedMovieEntity]>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<[FeaturedMovieEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[FeaturedMovieEntity]>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[FeaturedMovieEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetInitialAppOpenUseCase

open class GetInitialAppOpenUseCaseMock: GetInitialAppOpenUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<Bool> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetLastShownFeatureMoviePlayTimeUseCase

open class GetLastShownFeatureMoviePlayTimeUseCaseMock: GetLastShownFeatureMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        addInvocation(.m_execute__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_execute__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_execute__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for execute(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_execute__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__featuredMovieId_featuredMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__featuredMovieId_featuredMovieId: return ".execute(featuredMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_execute__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_execute__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_execute__featuredMovieId_featuredMovieId(`featuredMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_execute__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetLastShownMainMoviePlayTimeUseCase

open class GetLastShownMainMoviePlayTimeUseCaseMock: GetLastShownMainMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(mainMovieId: MainMovieId) -> Single<Float> {
        addInvocation(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__mainMovieId_mainMovieId(let lhsMainmovieid), .m_execute__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__mainMovieId_mainMovieId: return ".execute(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(mainMovieId: Parameter<MainMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetMainElementsUseCase

open class GetMainElementsUseCaseMock: GetMainElementsUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<MainDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<MainDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<MainDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<MainDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<MainDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MainDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetMainMovieUseCase

open class GetMainMovieUseCaseMock: GetMainMovieUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(mainMovieId: MainMovieId) -> Single<MainMovieEntity> {
        addInvocation(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Single<MainMovieEntity>
		do {
		    __value = try methodReturnValue(.m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for execute(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__mainMovieId_mainMovieId(let lhsMainmovieid), .m_execute__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__mainMovieId_mainMovieId: return ".execute(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(mainMovieId: Parameter<MainMovieId>, willReturn: Single<MainMovieEntity>...) -> MethodStub {
            return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Single<MainMovieEntity>>) -> Void) -> MethodStub {
            let willReturn: [Single<MainMovieEntity>] = []
			let given: Given = { return Given(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MainMovieEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_execute__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetMovieSettingsUseCase

open class GetMovieSettingsUseCaseMock: GetMovieSettingsUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<MovieSettingsDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<MovieSettingsDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<MovieSettingsDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<MovieSettingsDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<MovieSettingsDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MovieSettingsDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetProfileUseCase

open class GetProfileUseCaseMock: GetProfileUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<ProfileDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<ProfileDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<ProfileDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<ProfileDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<ProfileDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<ProfileDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetQuestionsUseCase

open class GetQuestionsUseCaseMock: GetQuestionsUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<QuestionDto> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<QuestionDto>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<QuestionDto>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<QuestionDto>>) -> Void) -> MethodStub {
            let willReturn: [Single<QuestionDto>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<QuestionDto>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - InitialAppOpenLocalStore

open class InitialAppOpenLocalStoreMock: InitialAppOpenLocalStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<Bool> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func changeFalse() -> Completable {
        addInvocation(.m_changeFalse)
		let perform = methodPerformValue(.m_changeFalse) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_changeFalse).casted()
		} catch {
			onFatalFailure("Stub return value not specified for changeFalse(). Use given")
			Failure("Stub return value not specified for changeFalse(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_changeFalse

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_changeFalse, .m_changeFalse): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case .m_changeFalse: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_changeFalse: return ".changeFalse()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func changeFalse(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func changeFalse(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func changeFalse() -> Verify { return Verify(method: .m_changeFalse)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func changeFalse(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_changeFalse, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - InitialAppOpenRepository

open class InitialAppOpenRepositoryMock: InitialAppOpenRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<Bool> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func changeFalse() -> Completable {
        addInvocation(.m_changeFalse)
		let perform = methodPerformValue(.m_changeFalse) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_changeFalse).casted()
		} catch {
			onFatalFailure("Stub return value not specified for changeFalse(). Use given")
			Failure("Stub return value not specified for changeFalse(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_changeFalse

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_changeFalse, .m_changeFalse): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case .m_changeFalse: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_changeFalse: return ".changeFalse()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func changeFalse(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func changeFalse(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func changeFalse() -> Verify { return Verify(method: .m_changeFalse)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func changeFalse(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_changeFalse, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - LastShownFeaturedMoviePlayTimeLocalStore

open class LastShownFeaturedMoviePlayTimeLocalStoreMock: LastShownFeaturedMoviePlayTimeLocalStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        addInvocation(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPlayTime(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for getPlayTime(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }

    open func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable {
        addInvocation(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))) as? (FeaturedMovieId, Float) -> Void
		perform?(`featuredMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
		}
		return __value
    }

    open func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable {
        addInvocation(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)
        case m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>, Parameter<Float>)
        case m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPlayTime__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_getPlayTime__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)

            case (.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let lhsFeaturedmovieid, let lhsPlaytime), .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let rhsFeaturedmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)

            case (.m_deletePlayTime__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_deletePlayTime__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getPlayTime__featuredMovieId_featuredMovieId(p0): return p0.intValue
            case let .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            case let .m_deletePlayTime__featuredMovieId_featuredMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPlayTime__featuredMovieId_featuredMovieId: return ".getPlayTime(featuredMovieId:)"
            case .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime: return ".savePlayTime(featuredMovieId:playTime:)"
            case .m_deletePlayTime__featuredMovieId_featuredMovieId: return ".deletePlayTime(featuredMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`))}
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`))}
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, perform: @escaping (FeaturedMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), performs: perform)
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - LastShownFeaturedMoviePlayTimeRepository

open class LastShownFeaturedMoviePlayTimeRepositoryMock: LastShownFeaturedMoviePlayTimeRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        addInvocation(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPlayTime(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for getPlayTime(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }

    open func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable {
        addInvocation(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))) as? (FeaturedMovieId, Float) -> Void
		perform?(`featuredMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
		}
		return __value
    }

    open func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable {
        addInvocation(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`)))
		let perform = methodPerformValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))) as? (FeaturedMovieId) -> Void
		perform?(`featuredMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>.value(`featuredMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
			Failure("Stub return value not specified for deletePlayTime(featuredMovieId: FeaturedMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getPlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)
        case m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>, Parameter<Float>)
        case m_deletePlayTime__featuredMovieId_featuredMovieId(Parameter<FeaturedMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPlayTime__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_getPlayTime__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)

            case (.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let lhsFeaturedmovieid, let lhsPlaytime), .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let rhsFeaturedmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)

            case (.m_deletePlayTime__featuredMovieId_featuredMovieId(let lhsFeaturedmovieid), .m_deletePlayTime__featuredMovieId_featuredMovieId(let rhsFeaturedmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getPlayTime__featuredMovieId_featuredMovieId(p0): return p0.intValue
            case let .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            case let .m_deletePlayTime__featuredMovieId_featuredMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPlayTime__featuredMovieId_featuredMovieId: return ".getPlayTime(featuredMovieId:)"
            case .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime: return ".savePlayTime(featuredMovieId:playTime:)"
            case .m_deletePlayTime__featuredMovieId_featuredMovieId: return ".deletePlayTime(featuredMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`))}
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`))}
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>) -> Verify { return Verify(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPlayTime(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_getPlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, perform: @escaping (FeaturedMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), performs: perform)
        }
        public static func deletePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, perform: @escaping (FeaturedMovieId) -> Void) -> Perform {
            return Perform(method: .m_deletePlayTime__featuredMovieId_featuredMovieId(`featuredMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - LastShownMainMoviePlayTimeLocalStore

open class LastShownMainMoviePlayTimeLocalStoreMock: LastShownMainMoviePlayTimeLocalStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getPlayTime(mainMovieId: MainMovieId) -> Single<Float> {
        addInvocation(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPlayTime(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for getPlayTime(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }

    open func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable {
        addInvocation(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))) as? (MainMovieId, Float) -> Void
		perform?(`mainMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for savePlayTime(mainMovieId: MainMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for savePlayTime(mainMovieId: MainMovieId, playTime: Float). Use given")
		}
		return __value
    }

    open func deletePlayTime(mainMovieId: MainMovieId) -> Completable {
        addInvocation(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deletePlayTime(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for deletePlayTime(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>)
        case m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>, Parameter<Float>)
        case m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPlayTime__mainMovieId_mainMovieId(let lhsMainmovieid), .m_getPlayTime__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)

            case (.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(let lhsMainmovieid, let lhsPlaytime), .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(let rhsMainmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)

            case (.m_deletePlayTime__mainMovieId_mainMovieId(let lhsMainmovieid), .m_deletePlayTime__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getPlayTime__mainMovieId_mainMovieId(p0): return p0.intValue
            case let .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            case let .m_deletePlayTime__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPlayTime__mainMovieId_mainMovieId: return ".getPlayTime(mainMovieId:)"
            case .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime: return ".savePlayTime(mainMovieId:playTime:)"
            case .m_deletePlayTime__mainMovieId_mainMovieId: return ".deletePlayTime(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`))}
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`))}
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, perform: @escaping (MainMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), performs: perform)
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - LastShownMainMoviePlayTimeRepository

open class LastShownMainMoviePlayTimeRepositoryMock: LastShownMainMoviePlayTimeRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getPlayTime(mainMovieId: MainMovieId) -> Single<Float> {
        addInvocation(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Single<Float>
		do {
		    __value = try methodReturnValue(.m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPlayTime(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for getPlayTime(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }

    open func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable {
        addInvocation(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))) as? (MainMovieId, Float) -> Void
		perform?(`mainMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for savePlayTime(mainMovieId: MainMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for savePlayTime(mainMovieId: MainMovieId, playTime: Float). Use given")
		}
		return __value
    }

    open func deletePlayTime(mainMovieId: MainMovieId) -> Completable {
        addInvocation(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deletePlayTime(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for deletePlayTime(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getPlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>)
        case m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>, Parameter<Float>)
        case m_deletePlayTime__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPlayTime__mainMovieId_mainMovieId(let lhsMainmovieid), .m_getPlayTime__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)

            case (.m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(let lhsMainmovieid, let lhsPlaytime), .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(let rhsMainmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)

            case (.m_deletePlayTime__mainMovieId_mainMovieId(let lhsMainmovieid), .m_deletePlayTime__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getPlayTime__mainMovieId_mainMovieId(p0): return p0.intValue
            case let .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            case let .m_deletePlayTime__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPlayTime__mainMovieId_mainMovieId: return ".getPlayTime(mainMovieId:)"
            case .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime: return ".savePlayTime(mainMovieId:playTime:)"
            case .m_deletePlayTime__mainMovieId_mainMovieId: return ".deletePlayTime(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, willReturn: Single<Float>...) -> MethodStub {
            return Given(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Single<Float>>) -> Void) -> MethodStub {
            let willReturn: [Single<Float>] = []
			let given: Given = { return Given(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Float>).self)
			willProduce(stubber)
			return given
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`))}
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`))}
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPlayTime(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_getPlayTime__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
        public static func savePlayTime(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, perform: @escaping (MainMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_savePlayTime__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), performs: perform)
        }
        public static func deletePlayTime(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_deletePlayTime__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainBannerContainerView

open class MainBannerContainerViewMock: MainBannerContainerView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func setupCollectionView() {
        addInvocation(.m_setupCollectionView)
		let perform = methodPerformValue(.m_setupCollectionView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_setupCollectionView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupCollectionView, .m_setupCollectionView): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_setupCollectionView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupCollectionView: return ".setupCollectionView()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func setupCollectionView() -> Verify { return Verify(method: .m_setupCollectionView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupCollectionView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setupCollectionView, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainBannerRepository

open class MainBannerRepositoryMock: MainBannerRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[MainBannerEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[MainBannerEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[MainBannerEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[MainBannerEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[MainBannerEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[MainBannerEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainMovieRepository

open class MainMovieRepositoryMock: MainMovieRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[MainMovieEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[MainMovieEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }

    open func findById(mainMovieId: MainMovieId) -> Single<MainMovieEntity> {
        addInvocation(.m_findById__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_findById__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
		var __value: Single<MainMovieEntity>
		do {
		    __value = try methodReturnValue(.m_findById__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findById(mainMovieId: MainMovieId). Use given")
			Failure("Stub return value not specified for findById(mainMovieId: MainMovieId). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll
        case m_findById__mainMovieId_mainMovieId(Parameter<MainMovieId>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match

            case (.m_findById__mainMovieId_mainMovieId(let lhsMainmovieid), .m_findById__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            case let .m_findById__mainMovieId_mainMovieId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            case .m_findById__mainMovieId_mainMovieId: return ".findById(mainMovieId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[MainMovieEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findById(mainMovieId: Parameter<MainMovieId>, willReturn: Single<MainMovieEntity>...) -> MethodStub {
            return Given(method: .m_findById__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[MainMovieEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[MainMovieEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[MainMovieEntity]>).self)
			willProduce(stubber)
			return given
        }
        public static func findById(mainMovieId: Parameter<MainMovieId>, willProduce: (Stubber<Single<MainMovieEntity>>) -> Void) -> MethodStub {
            let willReturn: [Single<MainMovieEntity>] = []
			let given: Given = { return Given(method: .m_findById__mainMovieId_mainMovieId(`mainMovieId`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MainMovieEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
        public static func findById(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_findById__mainMovieId_mainMovieId(`mainMovieId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
        public static func findById(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_findById__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainNewsRepository

open class MainNewsRepositoryMock: MainNewsRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[MainNewsEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[MainNewsEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[MainNewsEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[MainNewsEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[MainNewsEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[MainNewsEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainScreenCoodinator

open class MainScreenCoodinatorMock: MainScreenCoodinator, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func coordinateToMainMovieDetailPlayer(mainMovieId: MainMovieId) {
        addInvocation(.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`)))
		let perform = methodPerformValue(.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>.value(`mainMovieId`))) as? (MainMovieId) -> Void
		perform?(`mainMovieId`)
    }

    open func coordinateToFeaturedDetailPlayer() {
        addInvocation(.m_coordinateToFeaturedDetailPlayer)
		let perform = methodPerformValue(.m_coordinateToFeaturedDetailPlayer) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(Parameter<MainMovieId>)
        case m_coordinateToFeaturedDetailPlayer

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(let lhsMainmovieid), .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(let rhsMainmovieid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				return Matcher.ComparisonResult(results)

            case (.m_coordinateToFeaturedDetailPlayer, .m_coordinateToFeaturedDetailPlayer): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(p0): return p0.intValue
            case .m_coordinateToFeaturedDetailPlayer: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId: return ".coordinateToMainMovieDetailPlayer(mainMovieId:)"
            case .m_coordinateToFeaturedDetailPlayer: return ".coordinateToFeaturedDetailPlayer()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func coordinateToMainMovieDetailPlayer(mainMovieId: Parameter<MainMovieId>) -> Verify { return Verify(method: .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(`mainMovieId`))}
        public static func coordinateToFeaturedDetailPlayer() -> Verify { return Verify(method: .m_coordinateToFeaturedDetailPlayer)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func coordinateToMainMovieDetailPlayer(mainMovieId: Parameter<MainMovieId>, perform: @escaping (MainMovieId) -> Void) -> Perform {
            return Perform(method: .m_coordinateToMainMovieDetailPlayer__mainMovieId_mainMovieId(`mainMovieId`), performs: perform)
        }
        public static func coordinateToFeaturedDetailPlayer(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_coordinateToFeaturedDetailPlayer, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainView

open class MainViewMock: MainView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func setupCollectionView() {
        addInvocation(.m_setupCollectionView)
		let perform = methodPerformValue(.m_setupCollectionView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_setupCollectionView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupCollectionView, .m_setupCollectionView): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_setupCollectionView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupCollectionView: return ".setupCollectionView()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func setupCollectionView() -> Verify { return Verify(method: .m_setupCollectionView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupCollectionView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setupCollectionView, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieQualityLocalStore

open class MovieQualityLocalStoreMock: MovieQualityLocalStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<MovieQuality> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<MovieQuality>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func set(movieQuality: MovieQuality) -> Completable {
        addInvocation(.m_set__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`)))
		let perform = methodPerformValue(.m_set__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))) as? (MovieQuality) -> Void
		perform?(`movieQuality`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_set__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for set(movieQuality: MovieQuality). Use given")
			Failure("Stub return value not specified for set(movieQuality: MovieQuality). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_set__movieQuality_movieQuality(Parameter<MovieQuality>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_set__movieQuality_movieQuality(let lhsMoviequality), .m_set__movieQuality_movieQuality(let rhsMoviequality)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviequality, rhs: rhsMoviequality, with: matcher), lhsMoviequality, rhsMoviequality, "movieQuality"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case let .m_set__movieQuality_movieQuality(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_set__movieQuality_movieQuality: return ".set(movieQuality:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<MovieQuality>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func set(movieQuality: Parameter<MovieQuality>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_set__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<MovieQuality>>) -> Void) -> MethodStub {
            let willReturn: [Single<MovieQuality>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MovieQuality>).self)
			willProduce(stubber)
			return given
        }
        public static func set(movieQuality: Parameter<MovieQuality>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_set__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func set(movieQuality: Parameter<MovieQuality>) -> Verify { return Verify(method: .m_set__movieQuality_movieQuality(`movieQuality`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func set(movieQuality: Parameter<MovieQuality>, perform: @escaping (MovieQuality) -> Void) -> Perform {
            return Perform(method: .m_set__movieQuality_movieQuality(`movieQuality`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieQualityRepository

open class MovieQualityRepositoryMock: MovieQualityRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func find() -> Single<MovieQuality> {
        addInvocation(.m_find)
		let perform = methodPerformValue(.m_find) as? () -> Void
		perform?()
		var __value: Single<MovieQuality>
		do {
		    __value = try methodReturnValue(.m_find).casted()
		} catch {
			onFatalFailure("Stub return value not specified for find(). Use given")
			Failure("Stub return value not specified for find(). Use given")
		}
		return __value
    }

    open func save(movieQuality: MovieQuality) -> Completable {
        addInvocation(.m_save__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`)))
		let perform = methodPerformValue(.m_save__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))) as? (MovieQuality) -> Void
		perform?(`movieQuality`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_save__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for save(movieQuality: MovieQuality). Use given")
			Failure("Stub return value not specified for save(movieQuality: MovieQuality). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_find
        case m_save__movieQuality_movieQuality(Parameter<MovieQuality>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_find, .m_find): return .match

            case (.m_save__movieQuality_movieQuality(let lhsMoviequality), .m_save__movieQuality_movieQuality(let rhsMoviequality)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviequality, rhs: rhsMoviequality, with: matcher), lhsMoviequality, rhsMoviequality, "movieQuality"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_find: return 0
            case let .m_save__movieQuality_movieQuality(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_find: return ".find()"
            case .m_save__movieQuality_movieQuality: return ".save(movieQuality:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func find(willReturn: Single<MovieQuality>...) -> MethodStub {
            return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func save(movieQuality: Parameter<MovieQuality>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_save__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func find(willProduce: (Stubber<Single<MovieQuality>>) -> Void) -> MethodStub {
            let willReturn: [Single<MovieQuality>] = []
			let given: Given = { return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MovieQuality>).self)
			willProduce(stubber)
			return given
        }
        public static func save(movieQuality: Parameter<MovieQuality>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_save__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func find() -> Verify { return Verify(method: .m_find)}
        public static func save(movieQuality: Parameter<MovieQuality>) -> Verify { return Verify(method: .m_save__movieQuality_movieQuality(`movieQuality`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func find(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_find, performs: perform)
        }
        public static func save(movieQuality: Parameter<MovieQuality>, perform: @escaping (MovieQuality) -> Void) -> Perform {
            return Perform(method: .m_save__movieQuality_movieQuality(`movieQuality`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieSpeedLocalStore

open class MovieSpeedLocalStoreMock: MovieSpeedLocalStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<MovieSpeed> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<MovieSpeed>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func set(movieSpeed: MovieSpeed) -> Completable {
        addInvocation(.m_set__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`)))
		let perform = methodPerformValue(.m_set__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))) as? (MovieSpeed) -> Void
		perform?(`movieSpeed`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_set__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for set(movieSpeed: MovieSpeed). Use given")
			Failure("Stub return value not specified for set(movieSpeed: MovieSpeed). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_set__movieSpeed_movieSpeed(Parameter<MovieSpeed>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_set__movieSpeed_movieSpeed(let lhsMoviespeed), .m_set__movieSpeed_movieSpeed(let rhsMoviespeed)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviespeed, rhs: rhsMoviespeed, with: matcher), lhsMoviespeed, rhsMoviespeed, "movieSpeed"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case let .m_set__movieSpeed_movieSpeed(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_set__movieSpeed_movieSpeed: return ".set(movieSpeed:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<MovieSpeed>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func set(movieSpeed: Parameter<MovieSpeed>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_set__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<MovieSpeed>>) -> Void) -> MethodStub {
            let willReturn: [Single<MovieSpeed>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MovieSpeed>).self)
			willProduce(stubber)
			return given
        }
        public static func set(movieSpeed: Parameter<MovieSpeed>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_set__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func set(movieSpeed: Parameter<MovieSpeed>) -> Verify { return Verify(method: .m_set__movieSpeed_movieSpeed(`movieSpeed`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func set(movieSpeed: Parameter<MovieSpeed>, perform: @escaping (MovieSpeed) -> Void) -> Perform {
            return Perform(method: .m_set__movieSpeed_movieSpeed(`movieSpeed`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieSpeedRepository

open class MovieSpeedRepositoryMock: MovieSpeedRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func find() -> Single<MovieSpeed> {
        addInvocation(.m_find)
		let perform = methodPerformValue(.m_find) as? () -> Void
		perform?()
		var __value: Single<MovieSpeed>
		do {
		    __value = try methodReturnValue(.m_find).casted()
		} catch {
			onFatalFailure("Stub return value not specified for find(). Use given")
			Failure("Stub return value not specified for find(). Use given")
		}
		return __value
    }

    open func save(movieSpeed: MovieSpeed) -> Completable {
        addInvocation(.m_save__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`)))
		let perform = methodPerformValue(.m_save__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))) as? (MovieSpeed) -> Void
		perform?(`movieSpeed`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_save__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for save(movieSpeed: MovieSpeed). Use given")
			Failure("Stub return value not specified for save(movieSpeed: MovieSpeed). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_find
        case m_save__movieSpeed_movieSpeed(Parameter<MovieSpeed>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_find, .m_find): return .match

            case (.m_save__movieSpeed_movieSpeed(let lhsMoviespeed), .m_save__movieSpeed_movieSpeed(let rhsMoviespeed)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviespeed, rhs: rhsMoviespeed, with: matcher), lhsMoviespeed, rhsMoviespeed, "movieSpeed"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_find: return 0
            case let .m_save__movieSpeed_movieSpeed(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_find: return ".find()"
            case .m_save__movieSpeed_movieSpeed: return ".save(movieSpeed:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func find(willReturn: Single<MovieSpeed>...) -> MethodStub {
            return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func save(movieSpeed: Parameter<MovieSpeed>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_save__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func find(willProduce: (Stubber<Single<MovieSpeed>>) -> Void) -> MethodStub {
            let willReturn: [Single<MovieSpeed>] = []
			let given: Given = { return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<MovieSpeed>).self)
			willProduce(stubber)
			return given
        }
        public static func save(movieSpeed: Parameter<MovieSpeed>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_save__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func find() -> Verify { return Verify(method: .m_find)}
        public static func save(movieSpeed: Parameter<MovieSpeed>) -> Verify { return Verify(method: .m_save__movieSpeed_movieSpeed(`movieSpeed`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func find(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_find, performs: perform)
        }
        public static func save(movieSpeed: Parameter<MovieSpeed>, perform: @escaping (MovieSpeed) -> Void) -> Perform {
            return Perform(method: .m_save__movieSpeed_movieSpeed(`movieSpeed`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProfileRepository

open class ProfileRepositoryMock: ProfileRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func find() -> Single<ProfileEntity> {
        addInvocation(.m_find)
		let perform = methodPerformValue(.m_find) as? () -> Void
		perform?()
		var __value: Single<ProfileEntity>
		do {
		    __value = try methodReturnValue(.m_find).casted()
		} catch {
			onFatalFailure("Stub return value not specified for find(). Use given")
			Failure("Stub return value not specified for find(). Use given")
		}
		return __value
    }

    open func findAllActivities() -> Single<[ProfileActivityEntity]> {
        addInvocation(.m_findAllActivities)
		let perform = methodPerformValue(.m_findAllActivities) as? () -> Void
		perform?()
		var __value: Single<[ProfileActivityEntity]>
		do {
		    __value = try methodReturnValue(.m_findAllActivities).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAllActivities(). Use given")
			Failure("Stub return value not specified for findAllActivities(). Use given")
		}
		return __value
    }

    open func findAllComments() -> Single<[ProfileCommentEntity]> {
        addInvocation(.m_findAllComments)
		let perform = methodPerformValue(.m_findAllComments) as? () -> Void
		perform?()
		var __value: Single<[ProfileCommentEntity]>
		do {
		    __value = try methodReturnValue(.m_findAllComments).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAllComments(). Use given")
			Failure("Stub return value not specified for findAllComments(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_find
        case m_findAllActivities
        case m_findAllComments

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_find, .m_find): return .match

            case (.m_findAllActivities, .m_findAllActivities): return .match

            case (.m_findAllComments, .m_findAllComments): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_find: return 0
            case .m_findAllActivities: return 0
            case .m_findAllComments: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_find: return ".find()"
            case .m_findAllActivities: return ".findAllActivities()"
            case .m_findAllComments: return ".findAllComments()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func find(willReturn: Single<ProfileEntity>...) -> MethodStub {
            return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAllActivities(willReturn: Single<[ProfileActivityEntity]>...) -> MethodStub {
            return Given(method: .m_findAllActivities, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAllComments(willReturn: Single<[ProfileCommentEntity]>...) -> MethodStub {
            return Given(method: .m_findAllComments, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func find(willProduce: (Stubber<Single<ProfileEntity>>) -> Void) -> MethodStub {
            let willReturn: [Single<ProfileEntity>] = []
			let given: Given = { return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<ProfileEntity>).self)
			willProduce(stubber)
			return given
        }
        public static func findAllActivities(willProduce: (Stubber<Single<[ProfileActivityEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[ProfileActivityEntity]>] = []
			let given: Given = { return Given(method: .m_findAllActivities, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[ProfileActivityEntity]>).self)
			willProduce(stubber)
			return given
        }
        public static func findAllComments(willProduce: (Stubber<Single<[ProfileCommentEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[ProfileCommentEntity]>] = []
			let given: Given = { return Given(method: .m_findAllComments, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[ProfileCommentEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func find() -> Verify { return Verify(method: .m_find)}
        public static func findAllActivities() -> Verify { return Verify(method: .m_findAllActivities)}
        public static func findAllComments() -> Verify { return Verify(method: .m_findAllComments)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func find(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_find, performs: perform)
        }
        public static func findAllActivities(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAllActivities, performs: perform)
        }
        public static func findAllComments(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAllComments, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - QuestionRepository

open class QuestionRepositoryMock: QuestionRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func findAll() -> Single<[QuestionEntity]> {
        addInvocation(.m_findAll)
		let perform = methodPerformValue(.m_findAll) as? () -> Void
		perform?()
		var __value: Single<[QuestionEntity]>
		do {
		    __value = try methodReturnValue(.m_findAll).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAll(). Use given")
			Failure("Stub return value not specified for findAll(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findAll

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_findAll, .m_findAll): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findAll: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_findAll: return ".findAll()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func findAll(willReturn: Single<[QuestionEntity]>...) -> MethodStub {
            return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func findAll(willProduce: (Stubber<Single<[QuestionEntity]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[QuestionEntity]>] = []
			let given: Given = { return Given(method: .m_findAll, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[QuestionEntity]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findAll() -> Verify { return Verify(method: .m_findAll)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findAll(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAll, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SaveFavoriteMainMovieUseCase

open class SaveFavoriteMainMovieUseCaseMock: SaveFavoriteMainMovieUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func save(mainMovieEntity: MainMovieEntity) -> Completable {
        addInvocation(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`)))
		let perform = methodPerformValue(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`))) as? (MainMovieEntity) -> Void
		perform?(`mainMovieEntity`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>.value(`mainMovieEntity`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for save(mainMovieEntity: MainMovieEntity). Use given")
			Failure("Stub return value not specified for save(mainMovieEntity: MainMovieEntity). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_save__mainMovieEntity_mainMovieEntity(Parameter<MainMovieEntity>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_save__mainMovieEntity_mainMovieEntity(let lhsMainmovieentity), .m_save__mainMovieEntity_mainMovieEntity(let rhsMainmovieentity)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieentity, rhs: rhsMainmovieentity, with: matcher), lhsMainmovieentity, rhsMainmovieentity, "mainMovieEntity"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_save__mainMovieEntity_mainMovieEntity(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_save__mainMovieEntity_mainMovieEntity: return ".save(mainMovieEntity:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func save(mainMovieEntity: Parameter<MainMovieEntity>) -> Verify { return Verify(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func save(mainMovieEntity: Parameter<MainMovieEntity>, perform: @escaping (MainMovieEntity) -> Void) -> Perform {
            return Perform(method: .m_save__mainMovieEntity_mainMovieEntity(`mainMovieEntity`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SaveLastShownFeatureMoviePlayTimeUseCase

open class SaveLastShownFeatureMoviePlayTimeUseCaseMock: SaveLastShownFeatureMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable {
        addInvocation(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))) as? (FeaturedMovieId, Float) -> Void
		perform?(`featuredMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>.value(`featuredMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(Parameter<FeaturedMovieId>, Parameter<Float>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let lhsFeaturedmovieid, let lhsPlaytime), .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(let rhsFeaturedmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFeaturedmovieid, rhs: rhsFeaturedmovieid, with: matcher), lhsFeaturedmovieid, rhsFeaturedmovieid, "featuredMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime: return ".savePlayTime(featuredMovieId:playTime:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func savePlayTime(featuredMovieId: Parameter<FeaturedMovieId>, playTime: Parameter<Float>, perform: @escaping (FeaturedMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_savePlayTime__featuredMovieId_featuredMovieIdplayTime_playTime(`featuredMovieId`, `playTime`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SaveLastShownMainMoviePlayTimeUseCase

open class SaveLastShownMainMoviePlayTimeUseCaseMock: SaveLastShownMainMoviePlayTimeUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(mainMovieId: MainMovieId, playTime: Float) -> Completable {
        addInvocation(.m_execute__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`)))
		let perform = methodPerformValue(.m_execute__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))) as? (MainMovieId, Float) -> Void
		perform?(`mainMovieId`, `playTime`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>.value(`mainMovieId`), Parameter<Float>.value(`playTime`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(mainMovieId: MainMovieId, playTime: Float). Use given")
			Failure("Stub return value not specified for execute(mainMovieId: MainMovieId, playTime: Float). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__mainMovieId_mainMovieIdplayTime_playTime(Parameter<MainMovieId>, Parameter<Float>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__mainMovieId_mainMovieIdplayTime_playTime(let lhsMainmovieid, let lhsPlaytime), .m_execute__mainMovieId_mainMovieIdplayTime_playTime(let rhsMainmovieid, let rhsPlaytime)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMainmovieid, rhs: rhsMainmovieid, with: matcher), lhsMainmovieid, rhsMainmovieid, "mainMovieId"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPlaytime, rhs: rhsPlaytime, with: matcher), lhsPlaytime, rhsPlaytime, "playTime"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__mainMovieId_mainMovieIdplayTime_playTime(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__mainMovieId_mainMovieIdplayTime_playTime: return ".execute(mainMovieId:playTime:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>) -> Verify { return Verify(method: .m_execute__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(mainMovieId: Parameter<MainMovieId>, playTime: Parameter<Float>, perform: @escaping (MainMovieId, Float) -> Void) -> Perform {
            return Perform(method: .m_execute__mainMovieId_mainMovieIdplayTime_playTime(`mainMovieId`, `playTime`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SaveMovieQualityUseCase

open class SaveMovieQualityUseCaseMock: SaveMovieQualityUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(movieQuality: MovieQuality) -> Completable {
        addInvocation(.m_execute__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`)))
		let perform = methodPerformValue(.m_execute__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))) as? (MovieQuality) -> Void
		perform?(`movieQuality`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__movieQuality_movieQuality(Parameter<MovieQuality>.value(`movieQuality`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(movieQuality: MovieQuality). Use given")
			Failure("Stub return value not specified for execute(movieQuality: MovieQuality). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__movieQuality_movieQuality(Parameter<MovieQuality>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__movieQuality_movieQuality(let lhsMoviequality), .m_execute__movieQuality_movieQuality(let rhsMoviequality)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviequality, rhs: rhsMoviequality, with: matcher), lhsMoviequality, rhsMoviequality, "movieQuality"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__movieQuality_movieQuality(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__movieQuality_movieQuality: return ".execute(movieQuality:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(movieQuality: Parameter<MovieQuality>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(movieQuality: Parameter<MovieQuality>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__movieQuality_movieQuality(`movieQuality`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(movieQuality: Parameter<MovieQuality>) -> Verify { return Verify(method: .m_execute__movieQuality_movieQuality(`movieQuality`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(movieQuality: Parameter<MovieQuality>, perform: @escaping (MovieQuality) -> Void) -> Perform {
            return Perform(method: .m_execute__movieQuality_movieQuality(`movieQuality`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SaveMovieSpeedUseCase

open class SaveMovieSpeedUseCaseMock: SaveMovieSpeedUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(movieSpeed: MovieSpeed) -> Completable {
        addInvocation(.m_execute__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`)))
		let perform = methodPerformValue(.m_execute__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))) as? (MovieSpeed) -> Void
		perform?(`movieSpeed`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__movieSpeed_movieSpeed(Parameter<MovieSpeed>.value(`movieSpeed`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(movieSpeed: MovieSpeed). Use given")
			Failure("Stub return value not specified for execute(movieSpeed: MovieSpeed). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__movieSpeed_movieSpeed(Parameter<MovieSpeed>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__movieSpeed_movieSpeed(let lhsMoviespeed), .m_execute__movieSpeed_movieSpeed(let rhsMoviespeed)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMoviespeed, rhs: rhsMoviespeed, with: matcher), lhsMoviespeed, rhsMoviespeed, "movieSpeed"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__movieSpeed_movieSpeed(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__movieSpeed_movieSpeed: return ".execute(movieSpeed:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(movieSpeed: Parameter<MovieSpeed>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(movieSpeed: Parameter<MovieSpeed>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__movieSpeed_movieSpeed(`movieSpeed`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(movieSpeed: Parameter<MovieSpeed>) -> Verify { return Verify(method: .m_execute__movieSpeed_movieSpeed(`movieSpeed`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(movieSpeed: Parameter<MovieSpeed>, perform: @escaping (MovieSpeed) -> Void) -> Perform {
            return Perform(method: .m_execute__movieSpeed_movieSpeed(`movieSpeed`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - SettingsView

open class SettingsViewMock: SettingsView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func setupCollectionView() {
        addInvocation(.m_setupCollectionView)
		let perform = methodPerformValue(.m_setupCollectionView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_setupCollectionView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupCollectionView, .m_setupCollectionView): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_setupCollectionView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupCollectionView: return ".setupCollectionView()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func setupCollectionView() -> Verify { return Verify(method: .m_setupCollectionView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupCollectionView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setupCollectionView, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

