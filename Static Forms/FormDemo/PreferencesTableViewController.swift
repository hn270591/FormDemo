//
//  Table.swift
//  FormDemo
//
//  Created by Nguyen Dac Trung on 03/12/2022.
//

import UIKit

class PreferencesTableViewController: UITableViewController {
    @IBOutlet weak var autoRefreshSwitch: UISwitch!
    @IBOutlet weak var soundsSwitch: UISwitch!
    @IBOutlet weak var showPhotosSwitch: UISwitch!
    
    // should be set by the class that instantiates this view controller
    var currentPrefs: Preferences!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPrefs = currentPrefs ?? Preferences()
        initSwitches()
    }
    
    private func initSwitches() {
        autoRefreshSwitch?.isOn = currentPrefs.autoRefresh
        soundsSwitch?.isOn = currentPrefs.playSounds
        showPhotosSwitch?.isOn = currentPrefs.showPhotos
    }
    
    func preferencesFromTableData() -> Preferences {
        let newPrefs = Preferences()
        newPrefs.autoRefresh = autoRefreshSwitch.isOn
        newPrefs.playSounds = soundsSwitch.isOn
        newPrefs.showPhotos = showPhotosSwitch.isOn
        return newPrefs
    }
}
