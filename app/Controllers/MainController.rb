class MainController < UIViewController
    include BW::KVO

    HEADER_HEIGHT = 44

    def viewDidLoad
      self.title = ""

      self.view.backgroundColor = UIColor.clearColor

      @tableView = UITableView.alloc.initWithFrame([self.view.bounds.origin,[self.view.bounds.size.width,self.view.bounds.size.height-HEADER_HEIGHT]])
      @tableView.dataSource = @tableView.delegate = self
      @tableView.separatorStyle = UITableViewCellSeparatorStyleNone
      @tableView.backgroundColor = UIColor.clearColor

      self.view.addSubview @tableView

      # remove header
      label = UILabel.alloc.init.autorelease
      self.navigationItem.titleView = label

      _loadData
    end

    def _loadData
      @editions = Editions.new

      observe(@editions, 'list') do |old_value, new_value|
        if new_value
          @data = @editions.list
          @tableView.reloadData
          NSLog("Loaded!!#{@data.count}")
        else
          @data = []
          App.alert("unable to load data")
        end
      end

      @editions.load
    end

    # def tableView(tableView, numberOfRowsInSection: section)
    #   if @data then @data.count else 0 end
    # end

    def tableView(tableView, cellForRowAtIndexPath: indexPath)
      @reuseIdentifier ||= "CELL_IDENTIFIER"

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        OpenCodeCell.alloc.initWithOpenCodeStyle(@reuseIdentifier)
      end

      # update cell with data
      cell.update(@data[indexPath.row])

      cell
    end

    def tableView(tableView, numberOfRowsInSection: section)
      if @data then @data.count else 0 end
    end

    def tableView(tableView, didSelectRowAtIndexPath:indexPath)
      editionController = EditionController.alloc.initWithNibName(nil, bundle:nil)
      editionController.edition_id = @data[indexPath.row]["id"]

      self.navigationController.pushViewController(editionController, animated:true)
    end

end