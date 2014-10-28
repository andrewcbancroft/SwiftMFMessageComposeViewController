import UIKit

class ViewController: UIViewController {
	// Create a MessageComposer
	let messageComposer = MessageComposer()
	
	@IBAction func sendTextMessageButtonTapped(sender: UIButton) {
		// Make sure the device can send text messages
		if (messageComposer.canSendText()) {
			// Obtain a configured MFMessageComposeViewController
			let messageComposeVC = messageComposer.configuredMessageComposeViewController()
			
			// Present the configured MFMessageComposeViewController instance
			// Note that the dismissal of the VC will be handled by the messageComposer instance,
			// since it implements the appropriate delegate call-back
			presentViewController(messageComposeVC, animated: true, completion: nil)
		} else {
			// Let the user know if his/her device isn't able to send text messages
			let errorAlert = UIAlertView(title: "Cannot Send Text Message", message: "Your device is not able to send text messages.", delegate: self, cancelButtonTitle: "OK")
			errorAlert.show()
		}
	}
}