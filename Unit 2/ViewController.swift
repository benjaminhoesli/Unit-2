//
//  ViewController.swift
//  Unit 2
//
//  Created by Benjamin Hoesli on 07.02.23.
//

import UIKit


struct Movie {
    let movieName: String
    let movieDescription: String
    let artworkUrl100: URL
    let movieRating: String
    let moviePopularity: String
    let movieVotes: String

}

extension Movie {
    /// An array of mock tracks
    static var mockMovies: [Movie]  = [
        Movie(movieName: "Cars",
              movieDescription: "In a world where the towns are peopled with cars, and even the bugs are mini motors, a young ambitious racing car called Lightning McQueen is a star. On his way to an important event he has to stop in the little town of Radiator Springs after he accidentally damages the road and is forced to repair it. He finds living in a community oddly endearing, making true friends and beginning to realise there's more in life than winning. A Pixar animation.",
              artworkUrl100: URL(string:"https://images.squarespace-cdn.com/content/v1/51cdafc4e4b09eb676a64e68/1618602622635-4LFSCPXPMK8MOR64BC2N/cars_trip.jpg")!, movieRating:"Vote Average: 7.5",
              moviePopularity: "40.0 Popularity",
              movieVotes: "160 Votes"),
        Movie(movieName: "Cars2",
              movieDescription: "Racecar Lightning McQueen (Owen Wilson) and his tow-truck buddy, Mater (Larry the Cable Guy), have had their share of adventures together but nothing like what they experience when they head overseas for the first-ever World Grand Prix. While Lightning has his eye on the road to the championship, Mater takes a detour to international espionage when he meets British master spy Finn McMissile (Michael Caine) and stunning spy-in-training Holley Shiftwell (Emily Mortimer).",
              artworkUrl100: URL(string: "https://d23.com/app/uploads/2013/04/cars-2-1180w-600h-1180x600.jpg")!, movieRating:"Vote Average: 6.5",
              moviePopularity: "50.0 Popularity",
              movieVotes: "180 Votes"),
        Movie(movieName: "Cars3",
              movieDescription: "Blindsided by a new generation of blazing-fast cars, the legendary Lighting McQueen finds himself pushed out of the sport that he loves. Hoping to get back in the game, he turns to Cruz Ramirez, an eager young technician who has her own plans for winning. With inspiration from the Fabulous Hudson Hornet and a few unexpected turns, No. 95 prepares to compete on Piston Cup Racing's biggest stage.",
              artworkUrl100: URL(string: "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/480C5814B179254B5117CAEA8805BD680437DEC1554A1A387821815B242ABD17/scale?width=1200&aspectRatio=1.78&format=jpeg")!, movieRating:"Vote Average: 8.5",
              moviePopularity: "60.0 Popularity",
              movieVotes: "170 Votes"),
        Movie(movieName: "Ice Age",
              movieDescription: "Twenty-thousand years ago, Earth is a wondrous, prehistoric world filled with great danger, not the least of which is the beginning of the Ice Age. To avoid a really bad frostbite, the planet's majestic creatures - and a few small, slothful ones - begin migrating south . The story revolves around sub-zero heroes: a woolly mammoth, a saber-toothed tiger, a sloth and a prehistoric combination of a squirrel and rat that is known as Scrat.",
              artworkUrl100: URL(string:"https://www.hollywoodreporter.com/wp-content/uploads/2012/06/icemain_a.jpg")!, movieRating:"Vote Average: 9.5",
              moviePopularity: "80.0 Popularity",
              movieVotes: "260 Votes"),
        Movie(movieName: "Ice Age 2",
              movieDescription: "Ice Age: The Meltdown is a 2006 American computer-animated adventure comedy film produced by Blue Sky Studios and distributed by 20th Century Fox. It is the sequel to Ice Age (2002) and the second installment in the Ice Age film series.",
              artworkUrl100: URL(string: "https://whatsondisneyplus.com/wp-content/uploads/2022/04/the-meltdown.jpg")!, movieRating:"Vote Average: 5.5",
              moviePopularity: "30.0 Popularity",
              movieVotes: "60 Votes")
    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}
var movies: [Movie] = []



class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        //performSegue(withIdentifier: "detailSegue", sender: cell)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        movies=Movie.mockMovies
        // Do any additional setup after loading the view.
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get the index path for the current selected table view row (if exists)
        if let indexPath = tableView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
            
            
        }
    }

    
    
}

