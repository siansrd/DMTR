require_relative('../models/category')
require('pry-byebug')

cat0 = Category.new('label' => 'Category')
cat1 = Category.new('label' => 'Office')
cat2 = Category.new('label' => 'Travel')
cat3 = Category.new('label' => 'Clothing')
cat4 = Category.new('label' => 'Staff')
cat5 = Category.new('label' => 'Stock')
cat6 = Category.new('label' => 'Finacial')
cat7 = Category.new('label' => 'Premises')
cat8 = Category.new('label' => 'Marketing')

cat0.save
cat1.save
cat2.save
cat3.save
cat4.save
cat5.save
cat6.save
cat7.save
cat8.save

binding.pry
nil