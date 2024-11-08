import UIKit

class ViewController: UIViewController {

    private var games: [Game] = [
        Game(
            title: "Read Dead Redemption 2",
            description: "Red Dead Redemption 2 is a 2018 action-adventure game developed and published by Rockstar Games. The game is the third entry in the Red Dead series and a prequel to the 2010 game Red Dead Redemption.",
            image: .rdr2
        ),
        Game(
            title: "God of War",
            description: "God of War is an action-adventure game franchise created by David Jaffe and developed by Sony's Santa Monica Studio. It began in 2005 on the PlayStation 2 video game console and has become a flagship series for PlayStation, consisting of nine installments across multiple platforms.",
            image: .godofwar
        ),
        Game(
            title: "CS2",
            description: "Counter-Strike 2 is a 2023 free-to-play tactical first-person shooter game developed and published by Valve. It is the fifth entry in the Counter-Strike series, developed as an updated version of the previous entry, Counter-Strike: Global Offensive",
            image: .cs2
        ),
        Game(title: "Cyberpunk 77",
             description: "Cyberpunk 2077 is a 2020 action role-playing game developed by the Polish studio CD Projekt Red, and published by CD Projekt, and based on Mike Pondsmith's Cyberpunk tabletop game series. The plot is set in the fictional metropolis of Night City, California, within the dystopian Cyberpunk universe",
             image: .cyberpunk
        ),
        Game(title: "Elden Ring",
             description: "Elden Ring is a 2022 action role-playing game developed by FromSoftware. It was directed by Hidetaka Miyazaki with worldbuilding provided by American fantasy writer George R. R. Martin.",
             image: .eldenring
        ),
        Game(title: "GTA V",
             description: "Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the seventh main entry in the Grand Theft Auto series, following 2008's Grand Theft Auto IV, and the fifteenth instalment overal",
             image: .gta5
        ),
        Game(title: "The Witcher 3",
             description: "The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by the Polish studio CD Projekt. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third game in The Witcher video game series, played in an open world with a third-person perspective",
             image: .witcher
        ),
        Game(title: "Supermario",
             description: "Super Mario Odyssey is a 2017 platform game developed and published by Nintendo for the Nintendo Switch.",
             image: .supermario
        ),
        Game(title: "Halo",
             description:"Halo is a military science fiction video game series and media franchise, originally developed and created by Bungie and currently managed and developed by Halo Studios, part of Microsoft's Xbox Game Studios",
             image: .halo
        ),
        Game(title: "The Legend of Zelda",
             description: "The Legend of Zelda is a media franchise created by the Japanese game designers Shigeru Miyamoto and Takashi Tezuka. It is primarily developed and published by Nintendo; some portable installments and re-releases have been outsourced to Flagship, Vanpool, Grezzo, and Tantalus Media.",
             image: .zelda
        )
    ]

    @IBOutlet private weak var tableView: UITableView!

    private var selectedMovie: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedMovie)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = games[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = games[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
