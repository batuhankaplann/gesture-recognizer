
import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var myİmageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Bu kısım kullanıcının dokunarak etkileşime geçmesine izin verdigimiz alan.
        myİmageView.isUserInteractionEnabled = true
        
        // Kullanıcı dokugunda ne olacagını hangi fonksiyonun çalışacagını söyledigimiz kısım.
        let dokunuş = UITapGestureRecognizer(target: self , action: #selector(galeriyiAç))
        
        myİmageView.addGestureRecognizer(dokunuş)
        
        
    }

    // çalışacak fonskiyonu yazdıgımız kısım
    @objc func galeriyiAç(){
        
        let seçimler = UIImagePickerController()
        
        seçimler.delegate = self
        
        seçimler.sourceType = .photoLibrary
         
        
        // en önemlisi bu present kısmı. eğer bunu yazmazsak geri kalanları hiçbir önemi yok. gösteriyoruz.present ile.
        present(seçimler, animated: true, completion: nil)
        
    }
    
    // media da seçimin bittigini söyledigimiz kısım.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        myİmageView.image = (info[.originalImage]  as! UIImage)
        
        dismiss(animated: true, completion: nil)
    }

    
    
    
}

