//
//  TableViewController.swift
//  tableview
//
//  Created by Danil on 02.03.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    //let array = [1, 2, 3, 4, 5]
    
//    var arrayNames = ["Mike", "Dustin", "Lucas", "Will", "Eleven"]
//    var arraySurname = ["Wheeler", "Henderson", "Sinclair", "Byers", "Eleven"]
//    var arrayImage = ["mike", "dustin", "lucas", "will", "eleven"]
    
    var arrayPersons = [Person(name: "Mike", surname: "Wheeler", imagename: "mike"),
                        Person(name: "Dustin", surname: "Henderson", imagename: "dustin"),
                        Person(name: "Lucas", surname: "Sinclair", imagename: "lucas"),
                        Person(name: "Will", surname: "Byers", imagename: "will"),
                        Person(name: "Eleven", surname: "Eleven", imagename: "eleven")]
    var arrayAbout = ["Финн Ву́лфхард — канадский актёр. Наиболее известен по роли Майка Уилера в телесериале «Очень странные дела», по роли Ричи Тозиера в фильме ужасов «Оно», а также по роли Тревора Спенглера в фильме «Охотники за привидениями: Наследники».",
                      "Гаэтано Джон «Гейтен» Матараццо III — американский актёр. Наиболее известен по роли Дастина Хендерсона в телесериале «Очень странные дела». Исполнил роль Гавроша в бродвейской постановке мюзикла «Отверженные». В 2017 году снялся в клипе Кэти Перри «Swish Swish».",
                      "Ка́леб Макла́флин — американский актёр. Наиболее известен по роли Лукаса Синклера в телесериале «Очень странные дела». Он также играл молодого Симбу в бродвейской постановке мюзикла «Король Лев» в 2012—2014 годах.",
                      "Ноа Шнапп - американский актер. Его карьера началась в 2015 году, после дебюта в фильме «Шпионский мост», в котором он сыграл Роджера Донована. Наиболее известен по ролям в фильмах «Шпионский мост» (2015) и «Снупи и мелочь пузатая в кино» (2015) , но его самой известной работой является роль Уилла Байерса в оригинальном телесериале Netflix «Очень странные дела»",
                      "Милли Бобби Браун  — британская и американская актриса кино и телевидения, родившаяся в Испании и выросшая в Великобритании. Наиболее известна ролью девочки по имени Одиннадцать в сериале «Очень странные дела»"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    @IBAction func addPerson(_ sender: Any) 
        {
//            arrayNames.append("new name")
//            arraySurname.append("new surname")
//            arrayImage.append("avatar")
            
            arrayPersons.append(Person(name: "new name", surname: "new surname", imagename: "avatar"))
            arrayAbout.append("about")
            
            
            tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(1001) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
//        detailVc.name = arrayPersons[indexPath.row].name
//        detailVc.surname = arrayPersons[indexPath.row].surname
//        detailVc.imagename = arrayPersons[indexPath.row].imagename
        
        detailVc.person = arrayPersons[indexPath.row]
        detailVc.about = arrayAbout[indexPath.row]
//        detailVc.about = arrayPersons[indexPath.row].about
        
        navigationController?.show(detailVc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            arrayNames.remove(at: indexPath.row)
//            arraySurname.remove(at: indexPath.row)
//            arrayImage.remove(at: indexPath.row)
            
            arrayPersons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
