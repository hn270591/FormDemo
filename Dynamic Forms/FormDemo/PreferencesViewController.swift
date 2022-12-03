//
//  Table.swift
//  FormDemo
//
//  Created by Nguyen Dac Trung on 03/12/2022.
//

import UIKit

enum PrefRowIdentifier : String {
    case AutoRefresh = "Auto Refresh"
    case PlaySounds = "Play Sounds"
    case ShowPhotos = "Show Photos"
}

class PreferencesViewController: UIViewController, UITableViewDataSource, PreferenceSwitchCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    let tableStructure: [[PrefRowIdentifier]] = [[.AutoRefresh], [.PlaySounds, .ShowPhotos]]
    var prefValues: [PrefRowIdentifier: Bool] = [:]

    // should be set by the class that instantiates this view controller
    var currentPrefs: Preferences! {
        didSet {
            prefValues[.AutoRefresh] = currentPrefs.autoRefresh
            prefValues[.PlaySounds] = currentPrefs.playSounds
            prefValues[.ShowPhotos] = currentPrefs.showPhotos
            tableView?.reloadData()
        }
    }

    func preferencesFromTableData() -> Preferences {
        let ret = Preferences()
        ret.autoRefresh = prefValues[.AutoRefresh] ?? ret.autoRefresh
        ret.playSounds = prefValues[.PlaySounds] ?? ret.playSounds
        ret.showPhotos = prefValues[.ShowPhotos] ?? ret.showPhotos
        return ret
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentPrefs = currentPrefs ?? Preferences()
        tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableStructure.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableStructure[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferenceSwitchCell") as! PreferenceSwitchCell
        let prefIdentifier = tableStructure[indexPath.section][indexPath.row]
        cell.prefRowIdentifier = prefIdentifier
        cell.onOffSwitch.isOn = prefValues[prefIdentifier]!
        cell.delegate = self
        return cell
    }

    func preferenceSwitchCellDidToggle(cell: PreferenceSwitchCell, newValue: Bool) {
        prefValues[cell.prefRowIdentifier] = newValue
    }
}
