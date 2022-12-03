//
//  ViewController.swift
//  FormDemo
//
//  Created by Nguyen Dac Trung on 03/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var autoRefreshLabel: UILabel!
    @IBOutlet weak var playSoundsLabel: UILabel!
    @IBOutlet weak var showPhotosLabel: UILabel!

    var preferences: Preferences = Preferences() {
        didSet {
            updateLabels()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }

    private func updateLabels() {
        autoRefreshLabel.text = preferences.autoRefresh ? "Yes" : "No"
        playSoundsLabel.text = preferences.playSounds ? "Yes" : "No"
        showPhotosLabel.text = preferences.showPhotos ? "Yes" : "No"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPreferencesSegue" {
            // we wrapped our PreferencesTableViewController inside a UINavigationController
            let navController = segue.destination as! UINavigationController
            let prefsVC = navController.topViewController as! PreferencesViewController
            prefsVC.currentPrefs = self.preferences
        }
    }

    @IBAction func didSavePreferences(segue: UIStoryboardSegue) {
        if let prefsVC = segue.source as? PreferencesViewController {
            self.preferences = prefsVC.preferencesFromTableData()
        }
    }

    @IBAction func didCancelPreferences(segue: UIStoryboardSegue) {
        // do nothing
    }
}

