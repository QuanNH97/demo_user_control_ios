//
//  ViewController.swift
//  demoBasicUserControl
//
//  Created by quannh on 8/11/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    //Number of column of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //Title for row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var changedLabel: UILabel!
    @IBAction func changeSwitch(_ sender: Any) {
        if stateSwitch.isOn {
            changedLabel.text = "Switch is on"
        } else {
            changedLabel.text = "Switch is off"
        }
    }
    @IBOutlet weak var slider: UISlider!
    @IBAction func changeSlider(_ sender: Any) {
        let value = Int(slider.value)
        sliderValue.text = String(value)
    }
    @IBOutlet weak var sliderValue: UILabel!
    private func setupLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 50, y: 120, width: 200, height: 50))
        label.text = "A simple label"
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.textColor = .systemRed
        label.backgroundColor = .systemYellow
        label.numberOfLines = 2
        return label
    }
    private func setupTextField() -> UITextField {
        let textField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        textField.font = textField.font?.withSize(25)
        textField.textColor = .systemBlue
        textField.backgroundColor = .systemYellow
        textField.placeholder = "Enter your password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        return textField
    }
    private func setupTextView() -> UITextView {
        let textView = UITextView(frame: CGRect(x: 50, y: 270, width: 200, height: 50))
        textView.text = "A simple textView"
        textView.textAlignment = .center
        textView.textColor = .systemRed
        textView.backgroundColor = .systemYellow
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }
    private func setupSegment() -> UISegmentedControl {
        let segmentControl = UISegmentedControl(frame: CGRect(x: 110, y: 350, width: 200, height: 50))
        segmentControl.insertSegment(withTitle: "item1", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "item2", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "item3", at: 2, animated: true)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Label
        let label = setupLabel()
        view.addSubview(label)
        //Text field
        let textField = setupTextField()
        view.addSubview(textField)
        //Text view
        let textView = setupTextView()
        view.addSubview(textView)
        //Picker view
        //connect data of picker view
        self.picker.delegate = self
        self.picker.dataSource = self
        //Data of picker
        pickerData = ["item1", "item2", "item3", "item4", "item5"]
        //Segmented control
        let segmentControl = setupSegment()
        view.addSubview(segmentControl)
        //Search bar
        let searchBar = UISearchBar(frame: CGRect(x: 30, y: 50, width: 350, height: 50))
        searchBar.placeholder = "Search"
        view.addSubview(searchBar)
    }
}
