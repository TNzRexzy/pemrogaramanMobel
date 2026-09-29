// Mengimpor file model animal.dart agar bisa menggunakan class Animal
import '../models/animal.dart';

// Membuat daftar (List) yang berisi kumpulan objek Animal
List<Animal> dummyAnimals = [
  // Objek hewan pertama
  Animal(
    name: "Bengal Tiger",
    type: "Mammal",
    weight: 220.5,
    habitat: ["Forest", "Grassland"], // Array/List habitat
    height: 110,
    activities: ["Hunting", "Roaming", "Sleeping"], // Array/List aktivitas
    image: "https://images.pexels.com/photos/2055100/pexels-photo-2055100.jpeg",
  ),
  // Objek hewan kedua
  Animal(
    name: "Komodo Dragon",
    type: "Reptile",
    weight: 90.2,
    habitat: ["Island", "Dry Forest"],
    height: 70,
    activities: ["Basking", "Hunting", "Exploring"],
    image: "https://images.pexels.com/photos/2664272/pexels-photo-2664272.jpeg",
  ),
  // Objek hewan ketiga
  Animal(
    name: "African Grey Parrot",
    type: "Bird",
    weight: 0.4,
    habitat: ["Rainforest"],
    height: 33,
    activities: ["Flying", "Mimicking", "Eating Seeds"],
    image: "https://images.pexels.com/photos/97533/pexels-photo-97533.jpeg",
  ),
  // Objek hewan keempat
  Animal(
    name: "Green Sea Turtle",
    type: "Reptile",
    weight: 160.0,
    habitat: ["Ocean", "Coastal"],
    height: 120,
    activities: ["Swimming", "Diving", "Resting"],
    image: "https://images.pexels.com/photos/2289462/pexels-photo-2289462.jpeg",
  ),
  // Objek hewan kelima
  Animal(
    name: "Siberian Husky",
    type: "Dog",
    weight: 27.0,
    habitat: ["Domestic"],
    height: 60,
    activities: ["Running", "Pulling Sled", "Playing"],
    image: "https://images.pexels.com/photos/245035/pexels-photo-245035.jpeg",
  ),
  // Objek hewan keenam
  Animal(
    name: "Giant Panda",
    type: "Mammal",
    weight: 100.0,
    habitat: ["Bamboo Forest"],
    height: 75,
    activities: ["Eating Bamboo", "Climbing", "Sleeping"],
    image: "https://images.pexels.com/photos/32607009/pexels-photo-32607009.jpeg",
  ),
];
