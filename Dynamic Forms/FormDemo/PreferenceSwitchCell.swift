import UIKit

//Using 'class' keyword to define a class-constrained protocol is deprecated; use 'AnyObject' instead
protocol PreferenceSwitchCellDelegate: AnyObject {
    func preferenceSwitchCellDidToggle(cell: PreferenceSwitchCell, newValue:Bool)
}

class PreferenceSwitchCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!

    weak var delegate: PreferenceSwitchCellDelegate?

    var prefRowIdentifier: PrefRowIdentifier! {
        didSet {
            descriptionLabel?.text = prefRowIdentifier?.rawValue
        }
    }

    @IBAction func didToggleSwitch(sender: AnyObject) {
        delegate?.preferenceSwitchCellDidToggle(cell: self, newValue: onOffSwitch.isOn)
    }
}
