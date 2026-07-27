//
//  RadioUnavailableViewController.swift
//  Swift Radio
//

import UIKit
import LuciqSDK

/// Shown when a station cannot be played (e.g. Classic Rock). Displays a message and reports a non-fatal.
final class RadioUnavailableViewController: UIViewController {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "This radio can't be played"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(messageLabel)
        view.addSubview(okButton)
        okButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            okButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 24),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reportRadioStationLoadingError()
    }

    @objc private func dismissTapped() {
        dismiss(animated: true)
    }

    private func reportRadioStationLoadingError() {
        let error = NSError(
            domain: "SwiftRadio",
            code: -1,
            userInfo: [NSLocalizedDescriptionKey: "radio station loading error"]
        )
        if let nonFatal = CrashReporting.error(error) {
            nonFatal.stackTraceMode = .callerThread
            nonFatal.report()
        }
    }
}
