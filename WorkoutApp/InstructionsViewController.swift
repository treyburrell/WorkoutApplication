//
//  InstructionsViewController.swift
//  WorkoutApp
//
//  Created by Trey Burrell on 12/2/18.
//  Copyright © 2018 Rainer Sainvil. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    var name: UILabel!
    var main_muscle: UILabel!
    var other_muscle: UILabel!
    var workout_type: UILabel!
    var equipment: UILabel!
    var difficulty: UILabel!
    var instructions: UILabel!
    var picture_url: UIImageView!
    var exercises: [Workout]! = []
    var Workout: Workout!
    
    let padding: CGFloat = 20
    let labelHeight: CGFloat = 16
    let photoImageWidth: CGFloat = 100
    let photoImageHeight: CGFloat = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.numberOfLines = 0
        name.textAlignment = .center
        
        main_muscle = UILabel()
        main_muscle.translatesAutoresizingMaskIntoConstraints = false
        main_muscle.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        other_muscle = UILabel()
        other_muscle.translatesAutoresizingMaskIntoConstraints = false
        other_muscle.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        workout_type = UILabel()
        workout_type.translatesAutoresizingMaskIntoConstraints = false
        workout_type.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        equipment = UILabel()
        equipment.translatesAutoresizingMaskIntoConstraints = false
        equipment.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        difficulty = UILabel()
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        instructions = UILabel()
        instructions.translatesAutoresizingMaskIntoConstraints = false
        instructions.font = UIFont.systemFont(ofSize: 8)
        instructions.numberOfLines = 0
        
        picture_url = UIImageView()
        picture_url.translatesAutoresizingMaskIntoConstraints = false
        picture_url.contentMode = .scaleAspectFit
        
        
        view.addSubview(name)
        view.addSubview(main_muscle)
        view.addSubview(other_muscle)
        view.addSubview(workout_type)
        view.addSubview(equipment)
        view.addSubview(difficulty)
        view.addSubview(instructions)
        view.addSubview(picture_url)
        
        configure(for: self.Workout)
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: padding),
            ])
        
        NSLayoutConstraint.activate([
            picture_url.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            picture_url.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding),
            picture_url.heightAnchor.constraint(equalToConstant: photoImageHeight),
            picture_url.widthAnchor.constraint(equalToConstant: photoImageWidth)
            ])
        
        NSLayoutConstraint.activate([
            difficulty.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            difficulty.topAnchor.constraint(equalTo: picture_url.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            main_muscle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            main_muscle.topAnchor.constraint(equalTo: difficulty.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            other_muscle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            other_muscle.topAnchor.constraint(equalTo: main_muscle.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            workout_type.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            workout_type.topAnchor.constraint(equalTo: other_muscle.bottomAnchor, constant: padding),
            ])
        
        NSLayoutConstraint.activate([
            equipment.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            equipment.topAnchor.constraint(equalTo: workout_type.bottomAnchor, constant: padding),
            ])
        
        
        NSLayoutConstraint.activate([
            instructions.topAnchor.constraint(equalTo: equipment.bottomAnchor, constant: padding),
            instructions.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            instructions.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1*padding),
            ])
        
        
    }
    
    
    func setExercises(exercises: [Workout]) {
        self.exercises = exercises
    }
    
    func getWorkouts() {
        NetworkManager.getWorkout { (work) in
            self.exercises = work
        }
    }
    
    
    
    func getImageFromURLString(urlString: String) -> UIImage? {
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
    
    func configure(for work: Workout) {
        name.text = work.name
        main_muscle.text = work.main_muscle
        workout_type.text = work.workout_type
        difficulty.text = work.difficulty
        other_muscle.text = work.other_muscle
        equipment.text = work.equipment
        instructions.text = work.instructions
        let url = URL(string: work.picture_url)
        let data = try? Data(contentsOf: url!)
        picture_url.image = UIImage(data: data!)
        view.addSubview(picture_url)
        
    }
    
}

