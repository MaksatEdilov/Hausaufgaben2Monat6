//
//  StudentViewController.swift
//  HA2Monat6
//
//  Created by Maksat Edil on 8/1/24.
//


import UIKit

class StudentViewController: UIViewController {
    
    

    var collectionView: UICollectionView!
    var students: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        parseJSON()
    }

    
    func parseJSON() {
            if let path = Bundle.main.path(forResource: "Students", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let students = try JSONDecoder().decode([Student].self, from: data)
                    self.students = students
                    print(self.students)
                    collectionView.reloadData()
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                    print(error)
                }
            }
        }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width, height: 100) // Установите размер ячейки
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white

        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "StudentCell")

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
    }

}
extension StudentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCell", for: indexPath) as? StudentCollectionViewCell else {
            return UICollectionViewCell()
        }

        let student = students[indexPath.item]
        cell.studentNameLabel.text = student.studentName
        cell.studentSurnameLabel.text = student.studentSurname
        cell.studentImageView.image = UIImage(systemName: student.studentImage)

        return cell
    }
}
