//
//  Alert.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2022/04/22.
//

import UIKit

protocol AlertDelegate: AnyObject {
    func present(alert: UIAlertController)
}

class Alert {

    weak var delegate: AlertDelegate?

    func endAlert(title: String, message: String, okHandler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: okHandler
            )
        )
        present(alert: alert)
    }

    func deleteAlert(title: String, message: String, okHandler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let ok = UIAlertAction(
                title: "OK",
                style: .default,
                handler: okHandler
            )
        let cancel = UIAlertAction(
                title: "キャンセル",
                style: UIAlertAction.Style.cancel,
                handler: nil
            )
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert: alert)
    }

    func errorAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
        )
        present(alert: alert)
    }

    func present(alert: UIAlertController) {
        delegate?.present(alert: alert)
    }
}
