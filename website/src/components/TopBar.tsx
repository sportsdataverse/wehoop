import React, { ReactElement, useContext } from 'react'
import Toolbar from '@material-ui/core/Toolbar'
import SunIcon from '@material-ui/icons/WbSunnyOutlined'
import MoonIcon from '@material-ui/icons/Brightness2Outlined'
import CodeIcon from '@material-ui/icons/Code'
import DescriptionIcon from '@material-ui/icons/Description'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import AppBar from '@material-ui/core/AppBar'
import useScrollTrigger from '@material-ui/core/useScrollTrigger'
import { makeStyles } from '@material-ui/core/styles'
import { ToggleThemeContext } from '../theme'
import Link from 'next/link'
import { Tooltip } from '@material-ui/core'
import { NAME_AND_DOMAIN } from '../types/constants'

const useStyles = makeStyles({
  show: {
    transform: 'translateY(0)',
    transition: 'transform .5s',
  },
  hide: {
    transform: 'translateY(-110%)',
    transition: 'transform .5s',
  },
  toolbar: {
    paddingLeft: '5%',
  },
  toolbarContent: {
    paddingLeft: 70,
  },
  toolbarRight: {
    right: 0,
    position: 'absolute',
    paddingRight: '5%',
  },
})

export const TopBar = (): ReactElement => {
  const trigger = useScrollTrigger()
  const classes = useStyles()
  const { toggleTheme, isDark } = useContext(ToggleThemeContext)

  return (
    <AppBar className={trigger ? classes.hide : classes.show} position="sticky">
      <Toolbar className={classes.toolbar}>
        <Link href="/">
          <a>
            <img
              src="/logo/white.png"
              height="25px"
              alt="saiemgilani.me"
              style={{ paddingRight: 10, verticalAlign: 'bottom' }}
            />
          </a>
        </Link>
        <Link href="/">
          <a>
            <Typography variant="h6" style={!isDark ? { color: '#fff' } : {}}>
              {NAME_AND_DOMAIN}
            </Typography>
          </a>
        </Link>
        <div className={classes.toolbarContent}>
          <Link href="/references">
            <Button variant="text" color="inherit">
              <DescriptionIcon />
              &nbsp;Reference
            </Button>
          </Link>
          <Link href="/topics">
            <Button variant="text" color="inherit">
              <CodeIcon />
              &nbsp;Topics
            </Button>
          </Link>
        </div>
        <div className={classes.toolbarRight}>
          <Tooltip title="Toggle Theme">
            <Button variant="text" color="inherit" onClick={toggleTheme}>
              {isDark ? <SunIcon /> : <MoonIcon />}
            </Button>
          </Tooltip>
        </div>
      </Toolbar>
    </AppBar>
  )
}

export default TopBar
