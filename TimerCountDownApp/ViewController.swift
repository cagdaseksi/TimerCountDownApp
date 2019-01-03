import UIKit
class ViewController: UIViewController {
    var seconds = 30
    var timer = Timer()
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        lblTime.text = String(seconds)
    }
    @IBAction func btnStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    @IBAction func btnStop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        slider.setValue(30, animated: true)
        lblTime.text = "30"
    }
    @objc func counter() {
        seconds -= 1
        //lblTime.text = String(seconds)
        lblTime.text = timeString(time: TimeInterval(seconds))
        
        if (seconds == 0) {
            timer.invalidate()
            Alert()
        }
        slider.value = Float(seconds)
    }
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    func Alert() {
        let alertController = UIAlertController(title: "Time's Up", message: "A standard alert.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("cancel")
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
        
    }
    
}

