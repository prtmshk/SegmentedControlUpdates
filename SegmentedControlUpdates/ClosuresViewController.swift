//
//  ClosuresViewController.swift
//  SegmentedControlUpdates
//
//  Created by Prathamesh Kowarkar on 25/06/20.
//

import UIKit

class ClosuresViewController: UIViewController {

    private lazy var segmentedControl: UISegmentedControl = .init(
        frame: .zero,
        actions: Color.allCases.map { [unowned label] color in
            UIAction(title: color.rawValue) { _ in
                label.textColor = color.uiColor
            }
        }
    )

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text =
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac \
            dolor in erat scelerisque blandit. Vivamus sit amet lorem in mi du \
            faucibus tincidunt. Suspendisse neque neque, ornare quis sapien in \
            varius maximus nibh. Duis efficitur mi in metus rhoncus, a accumsa \
            lacus pulvinar. Praesent sed diam finibus, varius nisi quis, turpi \
            convallis tortor. Integer mattis purus et ex tincidunt, eget vivea \
            efficitur enim vulputate. Aliquam auctor lectus sit amet libro ate \
            pharetra pretium. Phasellus nec ligula maximus, consectetur turpis \
            ac, egestas urna. Nullam rutrum velit vitae sem suscipit sagittis. \
            Donec condimentum nunc nec elit eleifend, eu pulvinar sem interdi. \
            Maecenas posuere nunc quis lectus luctus placerat. Proin id eliti. \
            Donec consequat, ante nec tincidunt porta, nulla massa ornare veli \
            in malesuada velit eros id dui.
            """
        label.numberOfLines = 0
        return label
    } ()

    init() {
        super.init(nibName: nil, bundle: nil)

        setTitle()
        setTabBarItem()
        setBackgroundColor()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addStackView()
    }

    private func setTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Closures"
    }

    private func setTabBarItem() {
        tabBarItem.image = UIImage(systemName: "function")
    }

    private func setBackgroundColor() {
        view.backgroundColor = .systemBackground
    }

    private func addStackView() {
        let stackView = self.stackView()
        view.addSubview(stackView)
        setContstraints(of: stackView, in: view.layoutMarginsGuide)
        view.setNeedsLayout()
    }

    private func stackView() -> UIStackView {
        let views = [segmentedControl, label]
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    private func setContstraints(
        of stackView: UIStackView,
        in guide: UILayoutGuide
    ) {
        let constraints = [
            stackView.topAnchor.constraint(
                equalToSystemSpacingBelow: guide.topAnchor,
                multiplier: 1
            ),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            guide.bottomAnchor.constraint(
                greaterThanOrEqualToSystemSpacingBelow: stackView.bottomAnchor,
                multiplier: 1
            ),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
