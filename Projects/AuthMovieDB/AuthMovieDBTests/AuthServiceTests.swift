//
//  AuthServiceTests.swift
//  AuthMovieDBTests
//
//  Created by @ivansaul on 10/15/24.
//
//  https://github.com/ivansaul
//

@testable import AuthMovieDB
import XCTest

final class AuthServiceTests: XCTestCase {
    func testSuccessfulSignIn() async throws {
        let mockAuthService = MockAuthService()

        try await mockAuthService.signInWithTMDB()

        XCTAssertTrue(mockAuthService.signInCalled)

        let status = await mockAuthService.authStatus()
        XCTAssertEqual(status, .loggedIn)
    }

    func testFailedSignIn() async {
        let mockAuthService = MockAuthService()
        mockAuthService.shouldFailSignIn = true

        do {
            try await mockAuthService.signInWithTMDB()
            XCTFail("Expected an error to be thrown during sign in.")
        } catch {
            XCTAssertEqual(error as? AuthError, AuthError.denied)
        }
    }

    func testSignOut() async throws {
        let mockAuthService = MockAuthService()

        try await mockAuthService.signInWithTMDB()

        try await mockAuthService.signOut()

        XCTAssertTrue(mockAuthService.signOutCalled)

        let status = await mockAuthService.authStatus()
        XCTAssertEqual(status, .loggedOut)
    }
}
