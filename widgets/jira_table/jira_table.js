import React from 'react';
import Widget from '../../assets/javascripts/widget';
import {updatedAt, truncate} from '../../assets/javascripts/helpers';

import './jira_table.scss';

class TableRow extends React.Component {
  render() {
    return (
      <tr>
        <td><img className="priority-icon" src={this.props.priorityIcon} alt={this.props.priority} /></td>
        <td className="issue-key">{this.props.id}</td>
        <td className="issue-summary">{truncate(this.props.summary, this.props.summaryLength || 80)}</td>
      </tr>
    )
  }
}

export class JiraTable extends Widget {
  renderRows(issues) {
    return issues.map((item, i) => {
      return <TableRow key={i}
                       id={item.id}
                       summary={item.summary}
                       summaryLength={+this.props.summaryLength}
                       priority={item.priority.name}
                       priorityIcon={item.priority.iconUrl}/>;
    });
  }

  render() {
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h3>{this.props.text}</h3>
        <table>
          <thead>
            <tr>
              <th>&nbsp;</th>
              <th>Key</th>
              <th>Summary</th>
            </tr>
          </thead>
          <tbody>{this.renderRows(this.state.items || [])}</tbody>
        </table>
        <p className="more-info">{this.props.moreinfo}</p>
        <p className="updated-at">{updatedAt(this.state.updated_at)}</p>
      </div>
    )
  }
}

Widget.mount(JiraTable);
