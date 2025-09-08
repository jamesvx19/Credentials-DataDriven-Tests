import csv
def read_csv_file(filename):
    data = []
    with open(filename, 'r') as csvfile:       # we read the file and iterate through it and append it to a list Data[]
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return  data



