//
//  MasterViewController.swift
//  BookCatalog
//
//  Created by Anindya Sengupta on 8/6/15.
//  Copyright © 2015 Anindya Sengupta. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var counter = 0
    let books = ["The Great Gatsby by F. Scott Fitzgerald",
        "The Prince by Niccolo Machiavelli",
        "Slaughterhouse-Five by Kurt Vonnegut",
        "1984 by George Orwell",
        "The Republic by Plato",
        "Brothers Karamazov by Fyodor Dostoevsky",
        "The Catcher in the Rye by J.D. Salinger",
        "The Wealth of Nations by Adam Smith",
        "For Whom the Bell Tolls by Ernest Hemingway",
        "The Grapes of Wrath by John Steinbeck",
        "Brave New World by Aldous Huxley",
        "How To Win Friends And Influence People by Dale Carnegie",
        "The Rise of Theodore Roosevelt by Edmund Morris",
        "Dharma Bums by Jack Kerouac",
        "Catch-22 by Joseph Heller",
        "Walden by Henry David Thoreau",
        "Lord of the Flies by William Golding",
        "The Master and Margarita by by Mikhail Bulgakov",
        "Bluebeard by Kurt Vonnegut",
        "Atlas Shrugged by Ayn Rand",
        "The Metamorphosis by Franz Kafka",
        "Another Roadside Attraction by Tom Robbins",
        "White Noise by Don Delillo",
        "Ulysses by James Joyce",
        "The Young Man’s Guide by William Alcott",
        "Blood Meridian, or the Evening Redness in the West by Cormac McCarthy",
        "Seek: Reports from the Edges of America & Beyond by Denis Johnson",
        "Crime And Punishment by Fyodor Dostoevsky",
        "Steppenwolf by Herman Hesse",
        "East of Eden by John Steinbeck",
        "Essential Manners for Men by Peter Post",]
    var bookObjects = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        populateBookModel ()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    func insertNewObject(sender: AnyObject) {
        if (counter == bookObjects.count) {
            return
        }
        objects.insert(bookObjects[counter], atIndex: 0)
        counter++
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! Books
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row] as! Books
        cell.textLabel!.text = object.bookName
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // MARK: - Private Methods
    
    func populateBookModel () {
        books.map { (book: String) -> String in
            bookObjects.append(Books(bookName: book.componentsSeparatedByString(" by ")[0], author: book.componentsSeparatedByString(" by ")[1]))
            return book
        }
    }


}

